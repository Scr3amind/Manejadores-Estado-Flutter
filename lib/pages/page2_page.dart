import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:states/bloc/user/user_cubit.dart';
import 'package:states/models/user.dart';

class Page2Page extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final userCubit = BlocProvider.of<UserCubit>(context, listen: false);

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
                  professions: [
                    'Programmer',
                    '3D Artist'
                  ]
                );

                userCubit.selectUser(newUser);
              }
            ),

            MaterialButton(
              child: Text('Cambiar Edad', style: TextStyle(color: Colors.white)),
              color: Colors.blue,
              onPressed: () {
                userCubit.changeAge(26);
              }
            ),

            MaterialButton(
              child: Text('Añadir Profesión', style: TextStyle(color: Colors.white)),
              color: Colors.blue,
              onPressed: () {
                userCubit.addProfession();
              }
            ),

          ],
        )
     ),
   );
  }
}