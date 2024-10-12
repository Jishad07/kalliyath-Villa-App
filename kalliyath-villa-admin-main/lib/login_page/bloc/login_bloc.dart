import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {

      on<LoadingEvent>(loadingEvent);
   
  }

  FutureOr<void> loadingEvent(
      LoadingEvent event, Emitter<LoginState> emit) async {
   
      emit(LoadingEventstate(istrue: true));
      await Future.delayed(const Duration(seconds: 2));
      emit(LoadingEventstate(istrue: false));
    
  }
}
