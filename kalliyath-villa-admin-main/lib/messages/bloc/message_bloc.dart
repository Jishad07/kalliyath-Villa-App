import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'message_event.dart';
part 'message_state.dart';

class MessageBloc extends Bloc<MessageEvent, MessageState> {
  MessageBloc() : super(MessageInitial()) {
    on<MessageBoxRebuild>(messageBoxRebuild);
  }

  FutureOr<void> messageBoxRebuild(
      MessageBoxRebuild event, Emitter<MessageState> emit) {
    emit(MessageBoxRebuildState());
  }
}
