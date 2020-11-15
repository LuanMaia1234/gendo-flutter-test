//Objeto favorito do github
class Starred {
  int id;
  String name;
  String fullName;
  String description;
  int stargazersCount;
  int forks;

  Starred(this.id, this.fullName, this.description, this.stargazersCount);

  Starred.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    name = map['name'];
    fullName = map['full_name'];
    description = map['description'];
    stargazersCount = map['stargazers_count'];
    forks = map['forks'];
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      'id': id,
      'name': name,
      'full_name': fullName,
      'description': description,
      'stargazers_count': stargazersCount,
      'forks': forks,
    };
    return map;
  }

  @override
  String toString() {
    return 'id: $id,'
        ' full_name: $fullName,'
        ' name: $name,'
        ' description: $description,'
        ' stargazers_count: $stargazersCount,'
        ' forks: $forks,';
  }
}
