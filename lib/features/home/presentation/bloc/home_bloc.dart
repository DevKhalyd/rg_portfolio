import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'home_repository.dart';

part 'home_event.dart';
part 'home_state.dart';

// NOTE: HomeState can be replace by a enum if dont need share logic with the UI

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({required this.homeRepository})
      : super(const HomeToggleMenu(isOpen: false)) {
    on<HomeTogglePressed>(_onTogglePressed);
  }

  final HomeRepository homeRepository;

  void _onTogglePressed(
    HomeTogglePressed event,
    Emitter<HomeState> emit,
  ) async {
    try {
      homeRepository.toggleMenu();
      emit(HomeToggleMenu(isOpen: homeRepository.isMenuOpen));
    } catch (e) {
      emit(HomeError(message: e.toString()));
    }
  }
}
