import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../domain/usecases/searcher_item.dart';
import 'home_repository.dart';

part 'home_event.dart';
part 'home_state.dart';

/// Space for web implementation
const rightSpace = 90.0;

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({required this.homeRepository}) : super(HomeLoaded()) {
    on<HomeTogglePressed>(_onTogglePressed);
    on<HomeInitial>(_onHomeInitial);
    on<HomeSelectedSearch>(_onHomeSelectedSearch);
  }

  final HomeRepository homeRepository;

  void _onHomeSelectedSearch(
    HomeSelectedSearch event,
    Emitter<HomeState> emit,
  ) {
    try {
      emit(HomeSearch(search: event.item));
    } catch (e) {
      emit(HomeError(message: e.toString()));
    }
  }

  /// Helps to close the menu...
  void _onHomeInitial(
    HomeInitial event,
    Emitter<HomeState> emit,
  ) {
    try {
      if (homeRepository.isMenuOpen) homeRepository.toggleMenu();
      emit(HomeLoaded());
    } catch (e) {
      emit(HomeError(message: e.toString()));
    }
  }

  void _onTogglePressed(
    HomeTogglePressed event,
    Emitter<HomeState> emit,
  ) async {
    try {
      if (state is HomeToggleMenu) {
        final currentMenu = (state as HomeToggleMenu).menu;
        if (currentMenu != event.menu) {
          emit(HomeToggleMenu(
            isOpen: homeRepository.isMenuOpen,
            menu: event.menu,
          ));
          return;
        }
      }

      homeRepository.toggleMenu();
      emit(HomeToggleMenu(
        isOpen: homeRepository.isMenuOpen,
        menu: event.menu,
      ));
    } catch (e) {
      emit(HomeError(message: e.toString()));
    }
  }
}
