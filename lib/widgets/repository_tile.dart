import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gendofluttertest/models/git_repository.dart';
import 'package:url_launcher/url_launcher.dart';

//Widget customizado
class RepositoryTile extends StatelessWidget {
  final GitRepository _repository;

  RepositoryTile(this._repository);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10,top: 10),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        title: Text(_repository.fullName,
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue,fontSize: 18)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(_repository.description),
            SizedBox(height: 8),
            Row(
              children: [
                Icon(Icons.code,size: 18),
                SizedBox(width: 2),
                Text(_repository.language != null ? _repository.language : 'Linguagem não definida'),
                SizedBox(width: 10),
                Icon(CupertinoIcons.tuningfork,size: 16),
                SizedBox(width: 2),
                Text('${_repository.fork}'),
              ],
            ),
          ],
        ),
        onTap: (){
            launch('https://github.com/${_repository.fullName}');
        },
      ),
    );
  }
}
