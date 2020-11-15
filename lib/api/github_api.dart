import 'dart:convert';
import 'package:http/http.dart' as http;

//Classe para fazer requisição para api GitHub
class GitHubApi {
  final gitUrl = 'https://api.github.com';
  final token = 'd9b03aee3c71982ec4d431b629d366ba46c05db9';

  //Traz os repositórios do usuário
  getRepositories({String search}) async {
    http.Response response;
    if (search == null) {
      response = await http.get('$gitUrl/users/LuanMaia1234/repos',
          headers: {'Authorization': 'token $token'});
    } else {
      response = await http.get('$gitUrl/repos/LuanMaia1234/$search',
          headers: {'Authorization': 'token $token'});
    }

    if (response.statusCode == 200) {
      if (search != null) {
        List list = [];
        list.add(json.decode(response.body));
        return list;
      }
      return json.decode(response.body);
    } else {
      return [];
    }
  }

  //Traz os dados do usuário
  Future<Map<String, dynamic>> getUser() async {
    final response = await http.get('$gitUrl/users/LuanMaia1234',
        headers: {'Authorization': 'token $token'});
    return json.decode(response.body);
  }

  //Traz os favoritos do usuário
  getStarred({String search}) async {
    final response = await http.get('$gitUrl/users/LuanMaia1234/starred',
        headers: {'Authorization': 'token $token'});
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      return [];
    }
  }
}
