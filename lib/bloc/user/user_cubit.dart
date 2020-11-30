import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:states/models/user.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(InitialUser());

  void selectUser ( User user) {
    emit(new ActiveUser(user));
  }

  void changeAge (int age) {
    final currentState = state;
    if (currentState is ActiveUser) {
      final newUser = currentState.user.copyWith(age: 26);
      emit(ActiveUser(newUser));
    }
  }

  void addProfession() {
    final currentState = state;
    if (currentState is ActiveUser) {
      final newProfessions = currentState.user.professions;
      newProfessions.add('Profesion nueva ${newProfessions.length + 1}');

      final newUser = currentState.user.copyWith(age: 26, professions: newProfessions);
      emit(ActiveUser(newUser));
    }
  }

  void deleteUser() {
    emit(InitialUser());
  }


}