part of 'addvilla_bloc.dart';

@immutable
sealed class AddvillaEvent {}

class AcCheckboxcCick extends AddvillaEvent {
  final bool istrue;

  AcCheckboxcCick({required this.istrue});
}

class AdvillaInitial extends AddvillaEvent {
  final bool istrue;

  AdvillaInitial({required this.istrue});
}

class Photobuilder extends AddvillaEvent {}

class Photobuilderedit extends AddvillaEvent {}

class Dropdownbuilder extends AddvillaEvent {}

class Lodingbuilder extends AddvillaEvent {}

class Locationbuilder extends AddvillaEvent {}

class Statusbuilder extends AddvillaEvent {}

class Detailsbuilder extends AddvillaEvent {
  final bool istrue;

  Detailsbuilder({required this.istrue});
}

class Villadetailsimageloder extends AddvillaEvent {
  final bool istrue;

  Villadetailsimageloder({required this.istrue});
}
