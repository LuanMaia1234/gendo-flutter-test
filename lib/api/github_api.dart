import 'dart:convert';
import 'package:http/http.dart' as http;

//Classe para fazer requisição para api GitHub
class GitHubApi {
  final String gitUrl = 'https://api.github.com';
  final String token = 'b496eb0d70d4df9179d4e173da7a1de94f344133';

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
