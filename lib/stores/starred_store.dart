import 'package:gendofluttertest/api/github_api.dart';
import 'package:gendofluttertest/models/starred.dart';
import 'package:mobx/mobx.dart';

part 'starred_store.g.dart';

//Classe usada para alterar o estado Starred na tela
class StarredStore = _StarredStore with _$StarredStore;
enum StarredState { initial, loading, loaded }

abstract class _StarredStore with Store {
  final GitHubApi _gitHubApi = GitHubApi();

  @observable
  ObservableFuture starredFuture;

  @observable
  ObservableList<dynamic> starredList = ObservableList<dynamic>();

  @observable
  int listLength = 0;

  @observable
  String search;

  //Verifica o estado atual do Future
  @computed
  StarredState get state {
    if (starredFuture == null ||
        starredFuture.status == FutureStatus.rejected) {
      return StarredState.initial;
    } else if (starredFuture.status == FutureStatus.pending) {
      return StarredState.loading;
    } else {
      setStarredToList(starredFuture.result);
      return StarredState.loaded;
    }
  }

  //Obtem os dados do favorito da api e passa para o future verificado na tela
  @action
  Future<void> getStarred({String name}) async {
    try {
      if (name != null && name.isNotEmpty) {
        search = name;
      }
      starredFuture = null;
      starredFuture = ObservableFuture(_gitHubApi.getStarred());
    } catch (e) {
      print(e);
    }
  }

  @action
  void setStarredToList(List<dynamic> list) {
    if (search != null && search.isNotEmpty) {
      if (starredList.where((element) => element.name == search).length > 0) {
        starredList.removeWhere((element) => element.name != search);
      } else {
        starredList.clear();
        listLength = 0;
      }
      search = null;
    } else {
      starredList.clear();
      list.forEach((l) {
        starredList.add(Starred.fromMap(l));
      });
    }
  }
}
