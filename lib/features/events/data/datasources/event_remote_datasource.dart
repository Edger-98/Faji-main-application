import 'package:dio/dio.dart';
import 'package:fajimobileapp/core/network/api_response.dart';
import 'package:fajimobileapp/features/events/data/models/category_model.dart';
import 'package:fajimobileapp/features/events/data/models/event_model.dart';
import 'package:retrofit/retrofit.dart';

part 'event_remote_datasource.g.dart';

/// Event remote data source using Retrofit
@RestApi()
abstract class EventRemoteDataSource {
  factory EventRemoteDataSource(Dio dio, {String baseUrl}) =
      _EventRemoteDataSource;

  // Categories endpoints
  @GET('/categories')
  Future<ApiResponse<List<CategoryModel>>> getCategories();

  // Events endpoints
  @GET('/events')
  Future<HttpResponse<dynamic>> getEvents(
    @Queries() Map<String, dynamic> queries,
  );

  @GET('/events/trending')
  Future<ApiResponse<List<EventModel>>> getTrendingEvents(
    @Query('limit') int? limit,
    @Query('category') String? category,
  );

  @GET('/events/upcoming')
  Future<ApiResponse<List<EventModel>>> getUpcomingEvents(
    @Query('limit') int? limit,
    @Query('category') String? category,
  );

  @GET('/events/flash-deals')
  Future<ApiResponse<List<EventModel>>> getFlashDealEvents(
    @Query('limit') int? limit,
  );

  @GET('/events/{id}')
  Future<HttpResponse<dynamic>> getEventById(
    @Path('id') String id,
  );

  @GET('/events/my-events')
  Future<HttpResponse<dynamic>> getUserEvents();

  @GET('/events/favorites')
  Future<HttpResponse<dynamic>> getFavoriteEvents();

  @POST('/events/{id}/favorite')
  Future<HttpResponse<dynamic>> addToFavorites(
    @Path('id') String eventId,
  );

  @DELETE('/events/{id}/favorite')
  Future<HttpResponse<dynamic>> removeFromFavorites(
    @Path('id') String eventId,
  );

  @GET('/events/search')
  Future<HttpResponse<dynamic>> searchEvents(
    @Queries() Map<String, dynamic> queries,
  );

  // Event creation with category
  @POST('/events')
  Future<HttpResponse<dynamic>> createEvent(
    @Body() Map<String, dynamic> eventData,
  );
}
