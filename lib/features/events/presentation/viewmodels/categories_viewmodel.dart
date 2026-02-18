import 'package:dartz/dartz.dart';
import 'package:fajimobileapp/core/error/failures.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:fajimobileapp/core/usecases/usecase.dart';
import 'package:fajimobileapp/features/events/domain/entities/category_entity.dart';
import 'package:fajimobileapp/features/events/domain/usecases/get_categories_usecase.dart';

class CategoriesState {

  CategoriesState({
    this.categories = const [],
    this.isLoading = false,
    this.error,
    this.selectedCategory,
  });
  final List<CategoryEntity> categories;
  final bool isLoading;
  final String? error;
  final String? selectedCategory;

  CategoriesState copyWith({
    List<CategoryEntity>? categories,
    bool? isLoading,
    String? error,
    String? selectedCategory,
  }) => CategoriesState(
      categories: categories ?? this.categories,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      selectedCategory: selectedCategory ?? this.selectedCategory,
    );
}

class CategoriesViewModel extends StateNotifier<CategoriesState> {

  CategoriesViewModel({
    required this.getCategoriesUseCase,
  }) : super(CategoriesState());
  final GetCategoriesUseCase getCategoriesUseCase;

  Future<void> loadCategories() async {
    state = state.copyWith(isLoading: true);

    final Either<Failure, List<CategoryEntity>> result = await getCategoriesUseCase(NoParams());

    result.fold(
      (Failure failure) => state = state.copyWith(
        isLoading: false,
        error: failure.message,
      ),
      (List<CategoryEntity> categories) => state = state.copyWith(
        isLoading: false,
        categories: categories,
      ),
    );
  }

  void selectCategory(String? categoryId) {
    state = state.copyWith(selectedCategory: categoryId);
  }

  void clearSelection() {
    state = state.copyWith();
  }
}