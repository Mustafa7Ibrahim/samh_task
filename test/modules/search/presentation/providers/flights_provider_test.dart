import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_test/riverpod_test.dart';
import 'package:samh_task/modules/search/data/repository/search_repository.dart';
import 'package:samh_task/modules/search/domain/flights_model.dart';
import 'package:samh_task/modules/search/presentation/providers/flights_provider.dart';

class MockSearchRepository extends Mock implements SearchRepository {}

void main() {
  late MockSearchRepository mockSearchRepository;
  late List<FlightsModel> flights;

  setUp(() {
    // Create a mock instance of the SearchRepository
    mockSearchRepository = MockSearchRepository();
  });

  tearDown(() {
    reset(mockSearchRepository);
  });

  group(
    'FlightsProvider',
    () {
      flights = [
        FlightsModel(
          id: '1',
          companyName: 'IndiGo',
          image: 'assets/images/air.png',
          price: '\$200',
          departureTime: '06:00',
          arrivalTime: '08:30',
          flightDuration: '2h 30m',
        )
      ];
      testAsyncNotifier<Flights, List<FlightsModel>>(
        'should return a list of flights when getFlights is called successfully',
        provider: flightsProvider,
        // Override the searchRepositoryProvider with the mocked repository
        overrides: [
          searchRepositoryProvider.overrideWithValue(mockSearchRepository),
        ],
        // Act: Simulate the getFlights function being called
        act: (notifier) async {
          when(() => mockSearchRepository.getFlights())
              .thenAnswer((_) async => flights);
          return await notifier.build();
        },
        // Expected result: a list containing one flight model
        expect: () => <AsyncValue<List<FlightsModel>>>[AsyncData(flights)],
        verify: (notifier) {
          verify(() => mockSearchRepository.getFlights()).called(1);
        },
      );

      testAsyncNotifier<Flights, List<FlightsModel>>(
        'should throw an exception when getFlights fails',
        provider: flightsProvider,
        overrides: [
          searchRepositoryProvider.overrideWithValue(mockSearchRepository),
        ],
        act: (notifier) async {
          when(() => mockSearchRepository.getFlights())
              .thenThrow(Exception('Failed to load flights'));
          return await notifier.build();
        },
        expect: () => <AsyncValue<List<FlightsModel>>>[
          AsyncError(Exception('Failed to load flights'), StackTrace.empty),
        ],
        verify: (notifier) {
          verify(() => mockSearchRepository.getFlights()).called(1);
        },
      );
    },
  );
}
