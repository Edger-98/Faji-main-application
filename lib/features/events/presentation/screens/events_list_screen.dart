import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/design_system/design_system.dart';
import '../../../../core/routing/route_manager.dart';
import '../../../../core/services/toast_service.dart';
import '../../domain/entities/event_entity.dart';
import '../viewmodels/events_list_viewmodel.dart';
import '../widgets/event_list.dart';
import '../widgets/category_filter.dart';
import '../widgets/event_search_bar.dart';

/// Events List Screen with filters
class EventsListScreen extends ConsumerStatefulWidget {
  const EventsListScreen({super.key});

  @override
  ConsumerState<EventsListScreen> createState() => _EventsListScreenState();
}

class _EventsListScreenState extends ConsumerState<EventsListScreen> {
  final _searchController = TextEditingController();
  String? _selectedCategory;
  bool _isGridView = true;
  
  final List<String> _categories = [
    'Music',
    'Sports',
    'Technology',
    'Business',
    'Arts',
    'Food',
    'Health',
    'Education',
  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadEvents();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _loadEvents() {
    ref.read(eventsListViewModelProvider.notifier).getEvents(
      category: _selectedCategory,
      search: _searchController.text.isNotEmpty ? _searchController.text : null,
      limit: 20,
    );
  }

  void _onCategorySelected(String? category) {
    setState(() {
      _selectedCategory = category;
    });
    _loadEvents();
  }

  void _onSearchChanged(String query) {
    // Debounce search
    Future.delayed(const Duration(milliseconds: 500), () {
      if (_searchController.text == query) {
        _loadEvents();
      }
    });
  }

  void _onEventTap(EventEntity event) {
    context.push('${RouteManager.eventDetails}/${event.id}');
  }

  void _onFavoriteTap(EventEntity event) {
    ToastService.showInfo(
      context: context,
      message: 'Favorite feature coming soon!',
    );
  }

  void _toggleViewMode() {
    setState(() {
      _isGridView = !_isGridView;
    });
  }

  @override
  Widget build(BuildContext context) {
    final eventsState = ref.watch(eventsListViewModelProvider);

    return Scaffold(
      backgroundColor: context.colors.surface,
      appBar: AppBar(
        backgroundColor: context.colors.surface,
        elevation: 0,
        title: AppText.titleLarge(
          'Events',
          color: context.colors.onSurface,
        ),
        actions: [
          IconButton(
            icon: Icon(
              _isGridView ? Icons.view_list : Icons.grid_view,
              color: context.colors.onSurface,
            ),
            onPressed: _toggleViewMode,
          ),
          IconButton(
            icon: Icon(
              Icons.search,
              color: context.colors.onSurface,
            ),
            onPressed: () {
              context.push(RouteManager.searchEvents);
            },
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          _loadEvents();
        },
        child: Column(
          children: [
            // Search Bar
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
              child: EventSearchBar(
                controller: _searchController,
                onChanged: _onSearchChanged,
                hintText: 'Search events...',
              ),
            ),
            
            // Category Filter
            CategoryFilter(
              categories: _categories,
              selectedCategory: _selectedCategory,
              onCategorySelected: _onCategorySelected,
            ),
            
            SizedBox(height: 8.h),
            
            // Events List
            Expanded(
              child: eventsState.when(
                initial: () => const Center(
                  child: Text('Pull to refresh or search for events'),
                ),
                loading: () => EventList(
                  events: const [],
                  isLoading: true,
                  isGridView: _isGridView,
                ),
                success: (events) => EventList(
                  events: events,
                  isGridView: _isGridView,
                  onEventTap: _onEventTap,
                  onFavoriteTap: _onFavoriteTap,
                  onRetry: _loadEvents,
                ),
                error: (failure) => EventList(
                  events: const [],
                  error: failure.message,
                  isGridView: _isGridView,
                  onRetry: _loadEvents,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
