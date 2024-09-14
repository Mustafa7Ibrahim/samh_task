import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:samh_task/core/utils/get_typed_list.dart';
import 'package:samh_task/modules/search/data/data_source/fake_data.dart';
import 'package:samh_task/modules/search/domain/flights_model.dart';

part 'search_data_source.g.dart';

@riverpod
SearchDataSource searchDataSource(SearchDataSourceRef ref) {
  return SearchDataSource();
}

class SearchDataSource {
  Future<List<FlightsModel>> getFlights() async {
    try {
      final json = flightsMap;
      final flights = getTypeList<FlightsModel>(
        json['flights'],
        FlightsModel.fromJson,
      );
      return flights;
    } catch (e) {
      throw Exception(e);
    }
  }
}
