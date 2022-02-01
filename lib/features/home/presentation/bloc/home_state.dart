part of 'home_bloc.dart';

/*

What are the states?

Basically the state of the current page.

If u want to handle the state of the current page emit 
a new state handle by the events in the bloc.

*/

/*
From my perspective, the enum serves when u dont have to share data with the UI
just a state for the UI to know what to do.
enum HomeState {
  loading,
  loaded,
  error,
}*/

/// The states of the screen
abstract class HomeState extends Equatable {
  const HomeState();

  /// Avoid to override in the children classes
  @override
  List<Object> get props => [];
}

class HomeToggleMenu extends HomeState {
  const HomeToggleMenu({required this.isOpen, required this.menu});

  final bool isOpen;

  /// The menu to show in the screen
  final Widget menu;

  // This line is necesary for Bloc because allow to update the state
  // according to the previous state and the current one
  @override
  List<Object> get props => [isOpen, menu];
}

/// A base state of the bloc
class HomeLoaded extends HomeState {}

class HomeError extends HomeState {
  const HomeError({this.message = 'Error not defined'});

  final String message;

  @override
  List<Object> get props => [message];
}
