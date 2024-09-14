import 'package:freezed_annotation/freezed_annotation.dart';

part 'flights_model.freezed.dart';
part 'flights_model.g.dart';

@freezed
class FlightsModel with _$FlightsModel {
  factory FlightsModel({
    required String id,
    required String companyName,
    required String image,
    required String price,
    required String departureTime,
    required String arrivalTime,
    required String flightDuration,
  }) = _FlightsModel;

  factory FlightsModel.fromJson(Map<String, dynamic> json) =>
      _$FlightsModelFromJson(json);
}
