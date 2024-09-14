import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:samh_task/modules/search/data/data_source/search_data_source.dart';
import 'package:samh_task/modules/search/data/repository/search_repository.dart';
import 'package:samh_task/modules/search/domain/flights_model.dart';

class MockSearchDataSource extends Mock implements SearchDataSource {}

void main() {
  late SearchRepository searchRepository;
  late MockSearchDataSource mockSearchDataSource;

  setUp(() {
    // Create mock data source
    mockSearchDataSource = MockSearchDataSource();

    // Initialize SearchRepository with the mock data source
    searchRepository = SearchRepository(mockSearchDataSource);
  });

  group(
    'SearchRepository',
    () {
      // Test case for successful retrieval
      test(
        'should return a list of flights when the data source retrieves successfully',
        () async {
          // Arrange: Mock the return value of getFlights
          final flightsList = [
            FlightsModel(
              id: '1',
              companyName: 'IndiGo',
              image: 'assets/images/air.png',
              price: '\$200',
              departureTime: '06:00',
              arrivalTime: '08:30',
              flightDuration: '2h 30m',
            ),
          ];
          when(() => mockSearchDataSource.getFlights())
              .thenAnswer((_) async => flightsList);

          // Act: Call getFlights on the repository
          final result = await searchRepository.getFlights();

          // Assert: Verify the result matches the mocked flight list
          expect(result, flightsList);
          verify(() => mockSearchDataSource.getFlights()).called(1);
        },
      );

      // Test case for exception handling
      test(
        'should throw an exception when the data source throws an exception',
        () async {
          // Arrange: Mock the exception in the data source
          when(() => mockSearchDataSource.getFlights())
              .thenThrow(Exception('Failed to load flights'));

          // Act & Assert: Verify that the exception is thrown
          expect(
              () => searchRepository.getFlights(), throwsA(isA<Exception>()));
          verify(() => mockSearchDataSource.getFlights()).called(1);
        },
      );
    },
  );
}
