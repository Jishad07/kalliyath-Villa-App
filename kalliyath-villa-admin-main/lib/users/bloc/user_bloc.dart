import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitial()) {
    on<UserBuilderEvent>(userBuilderEvent);
  }

  FutureOr<void> userBuilderEvent(
      UserBuilderEvent event, Emitter<UserState> emit) {
    emit(UserBuilderEventState());
  }
}
