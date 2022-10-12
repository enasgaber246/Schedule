import 'package:dio/dio.dart';
import 'package:geocoding/geocoding.dart';
import 'package:intl/intl.dart';
import '../datasources/network/dio_exception.dart';
import '../datasources/network/endpoints.dart';
import '../datasources/network/schedule_api.dart';
import '../models/EventsResponse.dart';

class ScheduleRepository {
  final ScheduleApi scheduleApi;

  ScheduleRepository(this.scheduleApi);

  Future<List<EventsResponse>> getEventsRequested(int page) async {
    try {
      final response = await scheduleApi.getUpcomingEventsApi(Endpoints.userId, page);

      List<EventsResponse> events = [];
      if (response.data != null) {
        events = [];
        response.data.forEach((v) {
          events.add(EventsResponse.fromJson(v));
        });
      }

      return events;
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }

  Future<String> getAddress(double latitude, double longitude) async {
    List<Placemark> placeMarks =
        await placemarkFromCoordinates(latitude, longitude);

    Placemark placeMark = placeMarks[0];
    String? name = placeMark.name;
    String? subLocality = placeMark.subLocality;
    String? locality = placeMark.locality;
    String? administrativeArea = placeMark.administrativeArea;
    String? postalCode = placeMark.postalCode;
    String? country = placeMark.country;
    String? address =
        "$name, $subLocality, $locality, $administrativeArea $postalCode, $country";

    return '$subLocality - $name - $country';
  }
}
