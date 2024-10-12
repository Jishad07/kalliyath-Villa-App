part of 'message_bloc.dart';

@immutable
sealed class MessageEvent {}
class MessageBoxRebuild extends MessageEvent {}