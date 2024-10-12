part of 'booking_bloc.dart';

@immutable
sealed class BookingEvent {}

class ButtonEvent extends BookingEvent {
  final bool istrue;

  ButtonEvent({required this.istrue});
}

class Requestbuilder extends BookingEvent{

}
class Bookingbuilder extends BookingEvent{
  
}