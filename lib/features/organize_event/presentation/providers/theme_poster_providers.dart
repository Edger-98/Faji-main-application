import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/models/theme_model.dart';
import '../../../../core/models/poster_model.dart';
import '../../data/repositories/event_creation_repository.dart';

// Themes provider
final themesProvider = FutureProvider<List<ThemeModel>>((ref) async {
  final repository = ref.read(eventCreationRepositoryProvider);
  return repository.getThemes();
});

// Posters provider
final postersProvider = FutureProvider.family<List<PosterModel>, String?>((ref, category) async {
  final repository = ref.read(eventCreationRepositoryProvider);
  return repository.getPosters(category: category);
});
