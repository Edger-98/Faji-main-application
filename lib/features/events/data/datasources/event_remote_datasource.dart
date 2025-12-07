import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import 'package:fajimobileapp/core/network/api_response.dart';
import 'package:fajimobileapp/features/events/data/models/event_model.dart';

part 'event_remote_datasource.g.dart';

/// Event remote data source using Retrofit
@RestApi()
abstract class EventRemoteDataSource {
  factory EventRemoteDataSource(Dio dio, {String baseUrl}) =
      _EventRemoteDataSource;

  @GET('/events')
  Future<HttpResponse<dynamic>> getEvents(
    @Queries() Map<String, dynamic> queries,
  );

  @GET('/events/trending')
  Future<ApiResponse<List<EventModel>>> getTrendingEvents(
    @Query('limit') int? limit,
  );

  @GET('/events/upcoming')
  Future<ApiResponse<List<EventModel>>> getUpcomingEvents(
    @Query('limit') int? limit,
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
  Future<ApiResponse<List<EventModel>>> getFavoriteEvents();

  @POST('/events/{id}/favorite')
  Future<ApiResponse<bool>> addToFavorites(
    @Path('id') String eventId,
  );

  @DELETE('/events/{id}/favorite')
  Future<ApiResponse<bool>> removeFromFavorites(
    @Path('id') String eventId,
  );

  @GET('/events/search')
  Future<ApiResponse<List<EventModel>>> searchEvents(
    @Query('q') String query,
  );
}
