//Objeto usuário do github
class User {
  int id;
  String name;
  String bio;
  String avatarUrl;
  int publicRepos;

  User(this.id, this.name, this.bio, this.avatarUrl,this.publicRepos);

  User.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    name = map['name'];
    bio = map['bio'];
    avatarUrl = map['avatar_url'];
    publicRepos = map['public_repos'];
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      'id': id,
      'name': name,
      'bio': bio,
      'avatar_url': avatarUrl,
      'public_repos': publicRepos,
    };
    return map;
  }

  @override
  String toString() {
    return 'id: $id,'
        ' name: $name,'
        ' bio: $bio,'
        ' avatarUrl: $avatarUrl,'
        ' public_repos: $publicRepos,';
  }
}
