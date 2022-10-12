import 'package:dio/dio.dart';
import 'package:intl/intl.dart';

import 'dio_client.dart';
import 'endpoints.dart';

class ScheduleApi {
  final DioClient dioClient;

  ScheduleApi({required this.dioClient});

  Future<Response> getUpcomingEventsApi(String userId, int page) async {
    String dateGte = DateFormat("yyyy/MM/dd").format(DateTime.now());

    try {
      final Response response = await dioClient.get(
        Endpoints.endPointEventUpcoming + userId,
        queryParameters: {
          "date_gte": '2022/10/24',
          "page": page,
        },
        options: Options(
          headers: {
            "Content-Type": Endpoints.contentType,
            "authorization": Endpoints.token,
          },
        ),
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
