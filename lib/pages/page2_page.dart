import 'package:flutter/material.dart';
import 'package:states/models/user.dart';
import 'package:states/services/user_service.dart';


class Page2Page extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: StreamBuilder(
          stream: userService.userStream ,
          builder: (BuildContext context, AsyncSnapshot<User> snapshot){
            return snapshot.hasData
              ? Text(userService.user.name)
              : Text('Page 2');
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            MaterialButton(
              child: Text('Establecer Usuario', style: TextStyle(color: Colors.white)),
              color: Colors.blue,
              onPressed: () {
                final newUser = new User(name: 'Isaac', age: 24);
                userService.loadUser(newUser);
              }
            ),

            MaterialButton(
              child: Text('Cambiar Edad', style: TextStyle(color: Colors.white)),
              color: Colors.blue,
              onPressed: () {
                userService.changeAge(25);
              }
            ),

            MaterialButton(
              child: Text('Añadir Profesión', style: TextStyle(color: Colors.white)),
              color: Colors.blue,
              onPressed: () {}
            ),

          ],
        )
     ),
   );
  }
}