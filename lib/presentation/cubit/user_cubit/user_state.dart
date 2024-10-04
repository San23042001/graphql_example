part of 'user_cubit.dart';

sealed class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

final class UserInitial extends UserState {}

class UserLoadingState extends UserState {
  @override
  List<Object> get props => [];
}

class UserLoadedState extends UserState {
  final List<User> users;
  const UserLoadedState({required this.users});
  @override
  List<Object> get props => [users];
}

class UserErrorState extends UserState {
  final AppError error;

  const UserErrorState({required this.error});
  @override
  List<Object> get props => [error];
}
