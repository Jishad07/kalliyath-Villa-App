part of 'booking_bloc.dart';

@immutable
sealed class BookingState {}

final class BookingInitial extends BookingState {}

class ButtonEventstate extends BookingState {
  final bool istrue;

  ButtonEventstate({required this.istrue});
}

class Requestbuilderstate extends BookingState {}
class BookingbuilderState extends BookingState{}
class Loadingbuilderstate extends BookingState{}