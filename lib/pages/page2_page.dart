import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:states/bloc/user/user_bloc.dart';
import 'package:states/models/user.dart';


class Page2Page extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    // ignore: close_sinks
    final userBloc = BlocProvider.of<UserBloc>(context);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            MaterialButton(
              child: Text('Establecer Usuario', style: TextStyle(color: Colors.white)),
              color: Colors.blue,
              onPressed: () {

                final newUser = new User(
                  name: 'Isaac',
                  age: 25,
                  professions: ['Programador', 'Artista 3D', 'Devops']
                );

                userBloc.add(
                  ActivateUser(newUser)
                );
              }
            ),

            MaterialButton(
              child: Text('Cambiar Edad', style: TextStyle(color: Colors.white)),
              color: Colors.blue,
              onPressed: () {
                userBloc.add(
                  ChangeAge(26)
                );
              }
            ),

            MaterialButton(
              child: Text('Añadir Profesión', style: TextStyle(color: Colors.white)),
              color: Colors.blue,
              onPressed: () {
                userBloc.add(AddProfession('Nueva Profesión'));
              }
            ),

          ],
        )
     ),
   );
  }
}