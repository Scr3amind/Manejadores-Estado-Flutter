import 'package:flutter/material.dart';
import 'package:states/models/user.dart';

class UserService with ChangeNotifier{
  User _user;

  User get user => this._user;
  bool get userExists => (this._user != null) ? true : false;

  set user(User selectedUser){
    this._user = selectedUser;
    notifyListeners();
  }

  void changeAge(int newAge) {
    if(this._user == null){
      return;
    }
    this._user.age = newAge;
    notifyListeners();
  }

  void removeUser() {
    if(this._user == null){
      return;
    }
    
    this._user = null;
    notifyListeners();
  }

  void addProfession() {
    if(this._user == null){
      return;
    }

    this._user.professions.add('Profession ${this._user.professions.length + 1}');
    notifyListeners();
  }



}