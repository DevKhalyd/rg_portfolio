import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rg_portfolio/features/home/data/api/home_cloud_firestore_repository.dart';
import 'package:rg_portfolio/features/home/presentation/bloc/home_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_providers.g.dart';

/// Enum that represents the state of the menu
/// 
/// [hide] - The menu is hidden
/// [socialMedia] - The menu is showing the social media links
/// [profile] - The menu is showing the profile links
enum MenuState {
  hide,
  socialMedia,
  profile,
}

@riverpod
HomeRepository homeRepository(Ref _) =>
    HomeRepository(HomeCloudFirestoreRepository());

@riverpod
Future<int> getTotalViews(Ref ref) => ref.read(homeRepositoryProvider).getTotalViews();

// It seems @riverpod annotation do not generate the state provider instead generate a notifier provider
// So because the logic is simple I create a state provider manually
final StateProvider<MenuState> menuStateProvider = StateProvider<MenuState>(
  (ref) => MenuState.hide,
);