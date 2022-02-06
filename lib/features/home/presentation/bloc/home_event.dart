part of 'home_bloc.dart';

/*
Basically an event is handled from the Bloc.

The event do some validations to update the UI and emit a new state
for the UI.

So, the event could be whatever you want handle from the Bloc.

Use case:

```dart
    context
      .read<HomeBloc>()
      .add(const HomeTogglePressed(menu: MenuOptions()));
```
*/

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

/// Event when the user select a new item in the menu
class HomeSelectedSearch extends HomeEvent {
  const HomeSelectedSearch({required this.item});

  final SearchItem item;

  @override
  List<Object> get props => [item];
}

/// When the screen is in the initial state [HomeLoaded]
class HomeInitial extends HomeEvent {}
