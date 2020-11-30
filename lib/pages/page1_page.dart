import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:states/bloc/user/user_cubit.dart';
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
              final userCubit = BlocProvider.of<UserCubit>(context, listen: false);
              userCubit.deleteUser();
            }
          )
        ],
      ),

      body: ScaffoldBody(),

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.accessibility_new),
        onPressed: () => Navigator.pushNamed(context, 'page2'),
      ),
    );
  }
}

class ScaffoldBody extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, UserState>(
      builder: (_, state) { 

        switch (state.runtimeType) {

          case InitialUser:
            return Center(child: Text('No hay información del usuario'));
          break;

          case ActiveUser:
            return UserInfo((state as ActiveUser).user);
          break;
          
          default:
          return Center(child: Text('Estado no reconocido'));
        }

        // if (state is InitialUser) {
        //   return Center(child: Text('No hay información del usuario'));
        // }
        // else if ( state is ActiveUser ){
          
        //   return UserInfo(state.user);
        // }
        // else {
        //   return Center(child: Text('Estado no conocido'));
        // }

      });
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
          Text('Profesiones', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          Divider(),

          ...user.professions.map((profession) => ListTile(title: Text(profession)))
        ],
      ),
    );
  }
}