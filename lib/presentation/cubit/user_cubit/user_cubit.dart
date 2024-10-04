import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:graphql_example/data/models/user_model.dart';
import 'package:graphql_example/domain/entities/app_error.dart';
import 'package:graphql_example/domain/entities/mutation.dart';
import 'package:graphql_example/domain/entities/params/create_user_params.dart';
import 'package:graphql_example/domain/entities/params/delete_user_params.dart';
import 'package:graphql_example/domain/entities/queries.dart';

import 'package:graphql_example/domain/repositories/user_repository.dart';
import 'package:injectable/injectable.dart';

part 'user_state.dart';

@injectable
class UserCubit extends Cubit<UserState> {
  final UserRepository _userRepository;
  UserCubit(this._userRepository) : super(UserInitial());

  void getUsers() async {
    emit(UserLoadingState());
    final res = await _userRepository.getUsers(Queries.getUsers, {});
    res.fold(
      (error) => emit(UserErrorState(error: error)),
      (users) => emit(UserLoadedState(users: users.users)),
    );
  }

  void createUser({required CreateUserParams createUserParams}) async {
    emit(UserLoadingState());
    final res = await _userRepository.createUser(
        Mutation.createUser, createUserParams.toJson());
    res.fold(
      (error) => emit(UserErrorState(error: error)),
      (user) async {
        final currentState = state;
        if (currentState is UserLoadedState) {
          final updatedUsers = List<User>.from(currentState.users)
            ..add(user.user);
          emit(UserLoadedState(users: updatedUsers));
        } else {
          getUsers();
        }
      },
    );
  }

  void deleteUser({required DeleteUserParams deleteUserParams}) async {
    emit(UserLoadingState());
    final res = await _userRepository.deleteUser(
        Mutation.deleteUser, deleteUserParams.toJson());

    res.fold(
      (error) => emit(UserErrorState(error: error)),
      (_) async {
        final currentState = state;
        if (currentState is UserLoadedState) {
          final updatedUsers = currentState.users
              .where((user) => user.id != deleteUserParams.id)
              .toList();
          emit(UserLoadedState(users: updatedUsers));
        } else {
          getUsers();
        }
      },
    );
  }
}
