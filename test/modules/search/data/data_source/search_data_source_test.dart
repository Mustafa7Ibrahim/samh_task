import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:samh_task/core/utils/get_typed_list.dart';
import 'package:samh_task/modules/search/data/data_source/fake_data.dart';
import 'package:samh_task/modules/search/data/data_source/search_data_source.dart';
import 'package:samh_task/modules/search/domain/flights_model.dart';

class MockSearchDataSource extends Mock implements SearchDataSource {}

void main() {
  group('SearchDataSource', () {
    late SearchDataSource dataSource;

    setUp(() {
      dataSource = MockSearchDataSource();
    });

    test('should return a list of flights on successful retrieval', () async {
      // Arrange: Prepare the expected result
      final expectedFlights = getTypeList<FlightsModel>(
        flightsMap['flights'],
        FlightsModel.fromJson,
      );

      when(() => dataSource.getFlights())
          .thenAnswer((_) async => expectedFlights);

      // Act: Call the method
      final result = await dataSource.getFlights();

      // Assert: Check if the result matches the expected flights
      expect(result, expectedFlights);
    });

    test('should throw an exception if there is an error', () async {
      // Arrange: Simulate an error

      when(() => dataSource.getFlights())
          .thenThrow(Exception('Test exception'));

      // Act: Call the method
      expect(() => dataSource.getFlights(), throwsA(isA<Exception>()));
    });
  });
}
