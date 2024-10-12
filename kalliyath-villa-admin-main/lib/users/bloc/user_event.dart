part of 'user_bloc.dart';

@immutable
sealed class UserEvent {}

class UserBuilderEvent extends UserEvent{}