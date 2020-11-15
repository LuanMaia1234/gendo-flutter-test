import 'package:gendofluttertest/api/github_api.dart';
import 'package:gendofluttertest/models/git_repository.dart';
import 'package:mobx/mobx.dart';

part 'repository_store.g.dart';

//Classe usada para alterar o estado Repositório na tela
class RepositoryStore = _RepositoryStore with _$RepositoryStore;
enum RepositoryState { initial, loading, loaded }

abstract class _RepositoryStore with Store {
  final GitHubApi _gitHubApi = GitHubApi();

  @observable
  ObservableFuture repositoryFuture;

  @observable
  ObservableList<dynamic> repositoryList = ObservableList<dynamic>();

  @observable
  int listLength = 0;

  //Verifica o estado atual do Future
  @computed
  RepositoryState get state {
    if (repositoryFuture == null ||
        repositoryFuture.status == FutureStatus.rejected) {
      return RepositoryState.initial;
    } else if (repositoryFuture.status == FutureStatus.pending) {
      return RepositoryState.loading;
    } else {
      setRepositoryToList(repositoryFuture.result);
      return RepositoryState.loaded;
    }
  }

  @action
  void setRepositoryToList(List<dynamic> list) {
    repositoryList.clear();
    list.forEach((l) {
      repositoryList.add(GitRepository.fromMap(l));
    });
  }

  //Obtem os dados do repositorio da api e passa para o future verificado na tela
  @action
  Future<void> getRepositories({String name}) async {
    try {
      repositoryFuture = null;
      repositoryFuture = ObservableFuture(name != null && name.isNotEmpty ? _gitHubApi.getRepositories(search: name) : _gitHubApi.getRepositories());
    } catch (e) {
      print(e);
    }
  }

  @action
  void setListLength(int length) => listLength = length;
}