import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/datasources/network/dio_client.dart';
import '../../data/datasources/network/schedule_api.dart';
import '../../data/repositories/schedule_repository.dart';

class AddressBloc extends Bloc<AddressEvent, AddressState> {
  AddressBloc() : super(LoadingAddressState());

  @override
  Stream<AddressState> mapEventToState(AddressEvent event) async* {
    if (event is LoadAddressEvent) {
      yield LoadingAddressState();

      String address =
          await ScheduleRepository(ScheduleApi(dioClient: DioClient(Dio())))
              .getAddress(event.lat, event.lon);

      if (address.isNotEmpty) {
        yield LoadedAddressState(address);
      } else {
        yield FailedAddressState();
      }
    }
  }
}

// Event
abstract class AddressEvent {}

class LoadAddressEvent extends AddressEvent {
  final double lat;
  final double lon;

  LoadAddressEvent(this.lat, this.lon);
}

abstract class AddressState {}

class LoadingAddressState extends AddressState {}

class LoadedAddressState extends AddressState {
  final String address;

  LoadedAddressState(this.address);
}

class FailedAddressState extends AddressState {}
