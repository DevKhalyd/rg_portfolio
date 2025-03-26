import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rg_portfolio/features/home/data/api/home_cloud_firestore_repository.dart';
import 'package:rg_portfolio/features/home/presentation/bloc/home_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_providers.g.dart';

@riverpod
HomeRepository homeRepository(Ref _) =>
    HomeRepository(HomeCloudFirestoreRepository());

@riverpod
Future<int> getTotalViews(Ref ref) => ref.read(homeRepositoryProvider).getTotalViews();

// It seems @riverpod annotation do not generate the state provider instead generate a notifier provider\

// @Deprecated('Use the generated provider')
// final StateProvider<MenuState> menuStateProvider = StateProvider<MenuState>(
//   (ref) => MenuState.hide,
// );