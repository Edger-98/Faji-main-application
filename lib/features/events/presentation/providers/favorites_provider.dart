import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Simple state notifier to track favorite event IDs
class FavoritesNotifier extends StateNotifier<Set<String>> {
  FavoritesNotifier() : super(<String>{});

  void addFavorite(String eventId) {
    state = <String>{...state, eventId};
  }

  void removeFavorite(String eventId) {
    state = state.where((String id) => id != eventId).toSet();
  }

  void toggleFavorite(String eventId) {
    if (state.contains(eventId)) {
      removeFavorite(eventId);
    } else {
      addFavorite(eventId);
    }
  }

  bool isFavorite(String eventId) => state.contains(eventId);

  void setFavorites(Set<String> favorites) {
    state = favorites;
  }
}

/// Provider for favorites state
final StateNotifierProvider<FavoritesNotifier, Set<String>> favoritesProvider = StateNotifierProvider<FavoritesNotifier, Set<String>>((StateNotifierProviderRef<FavoritesNotifier, Set<String>> ref) => FavoritesNotifier());
