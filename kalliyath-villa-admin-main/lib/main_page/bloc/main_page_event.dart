part of 'main_page_bloc.dart';

@immutable
sealed class MainPageEvent {}

class Indexchange extends MainPageEvent {}

class AddvillaPageChange extends MainPageEvent {}

class CategoriesBuild extends MainPageEvent {}

class LoadingCircular extends MainPageEvent {}
