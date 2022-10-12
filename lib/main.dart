import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:schedule/features/schedule_task/data/datasources/network/dio_client.dart';
import 'package:schedule/features/schedule_task/data/datasources/network/schedule_api.dart';
import 'package:schedule/features/schedule_task/data/repositories/schedule_repository.dart';

import 'app.dart';

void main() {

  // ScheduleRepository(ScheduleApi(dioClient: DioClient(Dio())))
  //     .getEventsRequested();

  runApp(const MyApp());
}
