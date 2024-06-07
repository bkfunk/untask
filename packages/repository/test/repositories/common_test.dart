import 'package:flutter_test/flutter_test.dart';
import 'package:repository/data_items/data_item.dart';
import 'package:repository/repositories/fake.dart';
import 'package:repository/repositories/repository.dart';

class TestDataItem implements DataItem<String> {
  @override
  final String id;
  final String name;
  final bool isAvailable;
  final double price;

  TestDataItem(
      {required this.id,
      required this.name,
      required this.isAvailable,
      required this.price});
}

class CommonTest {
  Repository<DataItem<String>, String> repository;

  CommonTest({required this.repository});

  void setUp() {}

  void tearDown() {
    repository.dispose();
  }

  void runCRUDTests() {
    test('Should insert an item into the repository', () async {
      final item = TestDataItem(
        id: '1',
        name: 'Item 1',
        isAvailable: true,
        price: 10.0,
      );
      await repository.insert(item);

      final result = await repository.get('1');
      expect(result, equals(item));
    });

    test('should update an item in the repository', () async {
      final item = TestDataItem(
        id: '1',
        name: 'Item 1',
        isAvailable: true,
        price: 10.0,
      );
      await repository.insert(item);

      final updatedItem = TestDataItem(
        id: '1',
        name: 'Updated Item 1',
        isAvailable: false,
        price: 20.0,
      );
      await repository.update(updatedItem);

      final result = await repository.get('1');
      expect(result, equals(updatedItem));
    });

    test('should retrieve all items from the repository', () async {
      final item1 = TestDataItem(
        id: '1',
        name: 'Item 1',
        isAvailable: true,
        price: 10.0,
      );
      final item2 = TestDataItem(
        id: '2',
        name: 'Item 2',
        isAvailable: false,
        price: 20.0,
      );
      await repository.insert(item1);
      await repository.insert(item2);

      // final result = await repository.;
      // expect(result, contains(item1));
      // expect(result, contains(item2));
    });

    test('Should delete an item from the repository', () async {
      final item = TestDataItem(
        id: '1',
        name: 'Item 1',
        isAvailable: true,
        price: 10.0,
      );
      await repository.insert(item);
      await repository.delete('1');
      final result = await repository.get('1');
      expect(result, isNull);
    });
  }
}
