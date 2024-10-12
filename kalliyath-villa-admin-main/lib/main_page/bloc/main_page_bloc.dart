import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:kalliyath_villa_admin/firebase/firebase_get.dart';
import 'package:meta/meta.dart';

part 'main_page_event.dart';
part 'main_page_state.dart';

class MainPageBloc extends Bloc<MainPageEvent, MainPageState> {
  MainPageBloc() : super(MainPageInitial()) {
    on<Indexchange>(indexchange);
    on<AddvillaPageChange>(addvillaPageChange);
    on<CategoriesBuild>(categoriesBuild);
    on<LoadingCircular>(loadingCircular);
  }

  FutureOr<void> indexchange(Indexchange event, Emitter<MainPageState> emit) {
    emit(Indexstate());
  }

  FutureOr<void> addvillaPageChange(
      AddvillaPageChange event, Emitter<MainPageState> emit) {
    if (state is! AddvillaPageChangeState && state is! VillasChangeState) {
      emit(VillasChangeState());
      emit(Indexstate());
    } else if (state is AddvillaPageChangeState) {
      emit(VillasChangeState());
      emit(Indexstate());
    } else {
      emit(AddvillaPageChangeState());
      emit(Indexstate());
    }
  }

  FutureOr<void> categoriesBuild(
      CategoriesBuild event, Emitter<MainPageState> emit) async {
    await getcategories();
    emit(CategoriesBuildState());
  }

  FutureOr<void> loadingCircular(
      LoadingCircular event, Emitter<MainPageState> emit) async {
    emit(LoadingCircularState());

    await Future.delayed(const Duration(seconds: 2));
  }
}
