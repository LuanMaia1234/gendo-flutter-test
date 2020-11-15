import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gendofluttertest/models/starred.dart';
import 'package:url_launcher/url_launcher.dart';

//Widget customizado
class StarredTile extends StatelessWidget {
  final Starred _starred;

  StarredTile(this._starred);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10,top: 10),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        title: Text(_starred.name,
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue,fontSize: 18)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(_starred.description),
            SizedBox(height: 8),
            Row(
              children: [
                Icon(Icons.star, size: 18,color: Colors.black54,),
                SizedBox(width: 2),
                Text('${_starred.stargazersCount}'),
                SizedBox(width: 10),
                Icon(CupertinoIcons.tuningfork, size: 16),
                SizedBox(width: 2),
                Text('${_starred.forks}'),
              ],
            ),
          ],
        ),
        onTap: (){
          launch('https://github.com/${_starred.fullName}');
        },
      ),
    );
  }
}
