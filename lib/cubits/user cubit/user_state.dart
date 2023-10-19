part of 'user_cubit.dart';

sealed class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

final class UserInitial extends UserState {}
final class GetUserLoading extends UserState {}

final class GetUserSuccess extends UserState {}

final class GetUserFailure extends UserState {
  final String errorMessage;

  const GetUserFailure({required this.errorMessage});
}
