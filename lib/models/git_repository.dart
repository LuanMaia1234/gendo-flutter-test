//Objeto Repositório do github
class GitRepository {
  int id;
  String fullName;
  String description;
  String language;
  int fork;

  GitRepository(
      this.id, this.fullName, this.description, this.language, this.fork);

  GitRepository.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    fullName = map['full_name'];
    description = map['description'];
    language = map['language'];
    fork = map['forks_count'];
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      'id': id,
      'full_name': fullName,
      'description': description,
      'language': language,
      'forks_count': fork,
    };
    return map;
  }

  @override
  String toString() {
    return 'id: $id,'
        ' full_name: $fullName,'
        ' description: $description,'
        ' language: $language,'
        ' fork: $fork,';
  }
}
