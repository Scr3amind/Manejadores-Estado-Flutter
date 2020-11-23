import 'dart:async';

import 'package:states/models/user.dart';

class _UserService {
  User _user;

  User get user => this._user;

  bool get userExists => (this._user) != null ? true : false;

  StreamController<User> _userStreamController = new StreamController<User>.broadcast();

  Stream<User> get userStream => _userStreamController.stream;

  void loadUser(User user){
    this._user = user;
    this._userStreamController.add(user);
  }

  void changeAge(int age){
    this._user.age = age;
    this._userStreamController.add(this._user);
  }

  dispose() {
    this._userStreamController?.close();
  }

}

final userService = new _UserService();