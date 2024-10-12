import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'booking_event.dart';
part 'booking_state.dart';

class BookingBloc extends Bloc<BookingEvent, BookingState> {
  BookingBloc() : super(BookingInitial()) {
    on<ButtonEvent>(buttonEvent);
    on<Requestbuilder>(requestbuilder);
    on<Bookingbuilder>(bookingbuilder);
  }

  FutureOr<void> buttonEvent(ButtonEvent event, Emitter<BookingState> emit) {
    if (event.istrue == false) {
      emit(ButtonEventstate(istrue: true));
    } else if (event.istrue == true) {
      emit(ButtonEventstate(istrue: false));
    }
  }

  FutureOr<void> requestbuilder(
      Requestbuilder event, Emitter<BookingState> emit) {
    emit(Requestbuilderstate());
  }

  FutureOr<void> bookingbuilder(
      Bookingbuilder event, Emitter<BookingState> emit) {
    emit(BookingbuilderState());
  }
}
