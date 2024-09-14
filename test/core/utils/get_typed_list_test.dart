import 'package:flutter_test/flutter_test.dart';
import 'package:samh_task/core/utils/get_typed_list.dart';

// Sample model class for testing
class TestModel {
  final String id;
  final String name;

  TestModel({required this.id, required this.name});

  // Factory constructor to convert JSON into a NearbyPharmacies object
  factory TestModel.fromJson(Map<String, dynamic> json) {
    return TestModel(
      id: json['id'] as String,
      name: json['name'] as String,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TestModel && other.id == id && other.name == name;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode;
}

void main() {
  group('getTypeList', () {
    test(
        'should convert a dynamic JSON list to a list of NearbyPharmacies objects',
        () {
      // Arrange
      final jsonData = [
        {'id': '1', 'name': 'Pharmacy A'},
        {'id': '2', 'name': 'Pharmacy B'},
      ];

      // Act
      final nearbyPharmacies = getTypeList<TestModel>(
        jsonData,
        TestModel.fromJson,
      );

      // Assert
      expect(
        nearbyPharmacies,
        equals([
          TestModel(id: '1', name: 'Pharmacy A'),
          TestModel(id: '2', name: 'Pharmacy B'),
        ]),
      );
    });

    test('should return an empty list when the input list is empty', () {
      // Arrange
      final jsonData = [];

      // Act
      final nearbyPharmacies = getTypeList<TestModel>(
        jsonData,
        TestModel.fromJson,
      );

      // Assert
      expect(nearbyPharmacies, isEmpty);
    });

    test('should throw a TypeError when data is not a list', () {
      // Arrange
      final jsonData = {'id': '1', 'name': 'Pharmacy A'}; // Invalid data type

      // Act & Assert
      expect(
        () => getTypeList<TestModel>(
          jsonData,
          TestModel.fromJson,
        ),
        throwsA(isA<TypeError>()),
      );
    });

    test('should throw a TypeError when list items are not valid JSON maps',
        () {
      // Arrange
      final jsonData = [
        'Invalid data', // Not a Map<String, dynamic>
      ];

      // Act & Assert
      expect(
        () => getTypeList<TestModel>(
          jsonData,
          TestModel.fromJson,
        ),
        throwsA(isA<TypeError>()),
      );
    });
  });
}
