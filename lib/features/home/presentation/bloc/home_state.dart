part of 'home_bloc.dart';

/*
From my perspective, the enum serves when u dont have to share data with the UI
just a state for the UI to know what to do.
enum HomeStatus {
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
  final bool isOpen;

  const HomeToggleMenu({required this.isOpen});

  // This line is necesary for Bloc because allow to update the state
  // according to the previous state and the current one
  @override
  List<Object> get props => [isOpen];
}

class HomeLoaded extends HomeState {}

class HomeError extends HomeState {
  const HomeError({this.message = 'Error not defined'});

  final String message;

  @override
  List<Object> get props => [message];
}
