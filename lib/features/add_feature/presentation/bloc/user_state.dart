part of 'user_bloc.dart';

@immutable
 class UserState {
  final UserStatus userStatus;

  const UserState({required this.userStatus});

  UserState copyWith({
    UserStatus? newUserStatus
}){
    return UserState(userStatus: newUserStatus ?? userStatus);
  }
}
