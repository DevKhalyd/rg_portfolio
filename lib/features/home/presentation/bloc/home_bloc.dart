import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'home_repository.dart';

part 'home_event.dart';
part 'home_state.dart';

// NOTE: HomeState can be replace by a enum if dont need share logic with the UI

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({required this.homeRepository}) : super(HomeLoaded()) {
    on<HomeTogglePressed>(_onTogglePressed);
  }

  final HomeRepository homeRepository;

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
