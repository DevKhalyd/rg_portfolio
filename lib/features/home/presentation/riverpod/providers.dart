import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rg_portfolio/features/home/data/api/home_cloud_firestore_repository.dart';
import 'package:rg_portfolio/features/home/presentation/bloc/home_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'providers.g.dart';


@riverpod
HomeRepository homeRepository(Ref ref) =>
    HomeRepository(HomeCloudFirestoreRepository());

@riverpod
Future<int> getTotalViews(Ref ref) => ref.read(homeRepositoryProvider).getTotalViews();