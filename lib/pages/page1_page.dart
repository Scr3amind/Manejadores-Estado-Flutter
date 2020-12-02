import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:states/bloc/user/user_bloc.dart';
import 'package:states/models/user.dart';


class Page1Page extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page1'),
        actions: [
          IconButton(
            icon: Icon(Icons.exit_to_app), 
            onPressed: () {
              BlocProvider.of<UserBloc>(context).add(DeleteUser());
            }
          )
        ],
      ),
      body: BlocBuilder<UserBloc, UserState>(
        builder: (_, state) {
          if (state.userExists) {
            return UserInfo(state.user);
          }
          else {
            return Center(
              child: Text('No se ha seleccionado un usuario'),
            );
          }
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
          ListTile(title: Text('Nombre: ${user.name}')),
          ListTile(title: Text('Edad: ${user.age}')),
          Divider(),
          Text('Profesiones', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ...user.professions.map((profession) => ListTile(title: Text(profession)))
        ],
      ),
    );
  }
}