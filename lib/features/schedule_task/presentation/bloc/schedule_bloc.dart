import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:schedule/features/schedule_task/data/models/EventsResponse.dart';

import '../../data/datasources/network/dio_client.dart';
import '../../data/datasources/network/schedule_api.dart';
import '../../data/repositories/schedule_repository.dart';

class ScheduleBloc extends Bloc<ScheduleEvent, ScheduleState> {
  ScheduleBloc() : super(LoadingScheduleState());

  @override
  Stream<ScheduleState> mapEventToState(ScheduleEvent event) async* {
    if (event is LoadScheduleEvent) {
      yield LoadingScheduleState();

      List<EventsResponse> response =
          await ScheduleRepository(ScheduleApi(dioClient: DioClient(Dio())))
              .getEventsRequested(event.page);

      // if (response.isNotEmpty) {
      yield LoadedScheduleState(response, event.page);
      // } else {
      //   yield FailedScheduleState();
      // }
    } else if (event is ChangeDateEvent) {
      yield ChangeDateState(event.item);
    }
  }
}

// Event
abstract class ScheduleEvent {}

class LoadScheduleEvent extends ScheduleEvent {
  final int page;

  LoadScheduleEvent(this.page);
}

class ChangeDateEvent extends ScheduleEvent {
  final EventsResponse item;

  ChangeDateEvent(this.item);
}

// Trip Details States
abstract class ScheduleState {}

class LoadingScheduleState extends ScheduleState {}

class LoadedScheduleState extends ScheduleState {
  final List<EventsResponse> response;
  final int pageKey;

  LoadedScheduleState(this.response, this.pageKey);
}

class FailedScheduleState extends ScheduleState {}

class ChangeDateState extends ScheduleState {
  final EventsResponse item;

  ChangeDateState(this.item);
}
