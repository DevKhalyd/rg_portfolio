part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class HomeTogglePressed extends HomeEvent {
  const HomeTogglePressed({required this.menu});

  /// The menu to show in the screen
  final Widget menu;

  @override
  List<Object> get props => [menu];
}
