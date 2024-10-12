part of 'login_bloc.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

class LoadingEventstate extends LoginState {
  final bool istrue;

  LoadingEventstate({required this.istrue});
}
