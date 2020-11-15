import 'package:gendofluttertest/api/github_api.dart';
import 'package:gendofluttertest/models/user.dart';
import 'package:mobx/mobx.dart';

part 'user_store.g.dart';

//Classe usada para alterar o estado usuário na tela
class UserStore = _UserStore with _$UserStore;

abstract class _UserStore with Store {
  final GitHubApi _gitHubApi = GitHubApi();

  @observable
  User user;

  //Obtem os dados do usuário da api e transforma em um objeto User utilizado na tela
  @action
  Future<void> getUser() async {
    try {
      Map<String, dynamic> map = await _gitHubApi.getUser();
      user = User.fromMap(map);
    } catch (e) {
      print(e);
    }
  }
}