import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/core/helpers/api_constants.dart';
import 'package:store/models/address_model.dart';

part 'location_state.dart';

class LocationCubit extends Cubit<LocationState> {
  LocationCubit() : super(LocationInitial());
  final dio = Dio();

  Future<void> getAddress() async {
    try {
      emit(LocationLoading());

      final Response response = await dio.get(
        '${ApiConstants.baseUrl}${EndPoints.locations}',
      );

      final List<AddressModel> addresses = (response.data as List)
          .map((e) => AddressModel.fromJson(e))
          .toList();

      emit(LocationSuccess(addresses));
    } on DioException catch (e) {
      emit(LocationFailure(e.message ?? "Error found"));
    } catch (e) {
      emit(LocationFailure(e.toString()));
    }
  }
}
