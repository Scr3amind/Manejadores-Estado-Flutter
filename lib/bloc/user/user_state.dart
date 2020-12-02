part of 'user_bloc.dart';

class UserState {

  final bool userExists;
  final User user;

  UserState({User user})
    : this.user = user ?? null,
      this.userExists = (user != null) ? true : false;

  UserState copyWith({User user}) => UserState(
    user: user ?? this.user
  );

  UserState initialState() => UserState();

}