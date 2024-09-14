import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:samh_task/modules/search/data/data_source/search_data_source.dart';
import 'package:samh_task/modules/search/domain/flights_model.dart';

part 'search_repository.g.dart';

@riverpod
SearchRepository searchRepository(SearchRepositoryRef ref) {
  final dataSource = ref.read(searchDataSourceProvider);
  return SearchRepository(dataSource);
}

class SearchRepository {
  final SearchDataSource dataSource;

  SearchRepository(this.dataSource);

  Future<List<FlightsModel>> getFlights() async {
    return dataSource.getFlights();
  }
}
