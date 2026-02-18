import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fajimobileapp/core/models/theme_model.dart';
import 'package:fajimobileapp/core/models/poster_model.dart';
import 'package:fajimobileapp/features/organize_event/data/repositories/event_creation_repository.dart';

// Themes provider
final FutureProvider<List<ThemeModel>> themesProvider = FutureProvider<List<ThemeModel>>((FutureProviderRef<List<ThemeModel>> ref) async {
  final EventCreationRepository repository = ref.read(eventCreationRepositoryProvider);
  return repository.getThemes();
});

// Posters provider
final FutureProviderFamily<List<PosterModel>, String?> postersProvider = FutureProvider.family<List<PosterModel>, String?>((FutureProviderRef<List<PosterModel>> ref, String? category) async {
  final EventCreationRepository repository = ref.read(eventCreationRepositoryProvider);
  return repository.getPosters(category: category);
});
