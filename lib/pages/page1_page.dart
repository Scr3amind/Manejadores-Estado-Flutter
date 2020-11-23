import 'package:flutter/material.dart';
import 'package:states/models/user.dart';
import 'package:states/services/user_service.dart';


class Page1Page extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page1'),
      ),
      body: StreamBuilder(
        stream: userService.userStream ,
        builder: (BuildContext context, AsyncSnapshot<User> snapshot){
          return snapshot.hasData
            ? UserInfo(userService.user)
            : Center(child: Text('No hay información'));
        },
      ),

     floatingActionButton: FloatingActionButton(
       child: Icon(Icons.accessibility_new),
       onPressed: () => Navigator.pushNamed(context, 'page2'),
     ),
   );
  }
}

class UserInfo extends StatelessWidget {

  final User user;

  const UserInfo(this.user);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      padding: EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('General', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          Divider(),
          ListTile(title: Text('Nombre: ${this.user.name}')),
          ListTile(title: Text('Edad: ${this.user.age}')),
          Text('Profesiones', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          Divider(),
        ],
      ),
    );
  }
}