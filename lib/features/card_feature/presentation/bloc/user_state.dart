part of 'user_bloc.dart';

@immutable
 class UserState {
  final AddStatus userStatus;

  const UserState({required this.userStatus});

  UserState copyWith({
    AddStatus? newUserStatus
}){
    return UserState(userStatus: newUserStatus ?? userStatus);
  }
}
