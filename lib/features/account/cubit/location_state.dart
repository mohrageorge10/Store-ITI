part of 'location_cubit.dart';

abstract class LocationState {}

final class LocationInitial extends LocationState {}

final class LocationLoading extends LocationState {}

final class LocationSuccess extends LocationState {
  final List<AddressModel> addresses;
  LocationSuccess(this.addresses);
}

final class LocationFailure extends LocationState {
  final String message;
  LocationFailure(this.message);
}
