import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:samh_task/modules/search/data/repository/search_repository.dart';
import 'package:samh_task/modules/search/domain/flights_model.dart';

part 'flights_provider.g.dart';

@riverpod
class Flights extends _$Flights {
  @override
  FutureOr<List<FlightsModel>> build() async {
    return _getFlights();
  }

  Future<List<FlightsModel>> _getFlights() async {
    // add a fake delay to simulate a network request
    await Future.delayed(Duration(seconds: 1));
    return await ref.read(searchRepositoryProvider).getFlights();
  }
}
