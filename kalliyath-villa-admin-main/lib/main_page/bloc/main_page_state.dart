part of 'main_page_bloc.dart';

@immutable
sealed class MainPageState {}

final class MainPageInitial extends MainPageState {}

class Indexstate extends MainPageState {}

class AddvillaPageChangeState extends MainPageState {}

class VillasChangeState extends MainPageState {}
class CategoriesBuildState extends MainPageState {}

class LoadingCircularState extends MainPageState {}
class LoadingCircularStopState extends MainPageState {}