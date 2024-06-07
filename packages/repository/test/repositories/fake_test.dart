import 'package:flutter_test/flutter_test.dart';
import 'package:repository/data_items/data_item.dart';
// import 'package:repository/repositories/fake.dart';
import 'package:repository/repositories/fake.dart';
import 'package:repository/repositories/repository.dart';
import 'common_test.dart';

void main() {
  group('FakeRepository', () {
    late CommonTest commonTest;
    late FakeRepository<TestDataItem, String> repository;

    setUp(() {
      repository = FakeRepository();
      commonTest = CommonTest(
          repository: repository as Repository<TestDataItem, String>);
    });

    tearDown(() {
      commonTest.tearDown();
    });

    group('Run CRUD tests', () => commonTest.runCRUDTests());
  });
}

  //   test('should insert an item into the repository', () async {
  //     commonTest.testInsertItem();
  //     // final item = TestDataItem(id: '1', name: 'Item 1');
  //     // await repository.insert(item);

  //     // final result = await fakeRepository.get('1');
  //     // expect(result, equals(item));
  //   });

  //   test('should update an item in the repository', () async {
  //     final item = TestDataItem(id: '1', name: 'Item 1');
  //     await fakeRepository.insert(item);

  //     final updatedItem = TestDataItem(id: '1', name: 'Updated Item 1');
  //     await fakeRepository.update(updatedItem);

  //     final result = await fakeRepository.get('1');
  //     expect(result, equals(updatedItem));
  //   });

  //   test('should delete an item from the repository', () async {
  //     final item = TestDataItem(id: '1', name: 'Item 1');
  //     await fakeRepository.insert(item);

  //     await fakeRepository.delete('1');

  //     final result = await fakeRepository.get('1');
  //     expect(result, isNull);
  //   });

  //   test('should emit updated items when the repository is watched', () async {
  //     final item = TestDataItem(id: '1', name: 'Item 1');
  //     await fakeRepository.insert(item);

  //     final stream = fakeRepository.watchList();

  //     final items = await stream.first;
  //     expect(items, contains(item));

  //     final updatedItem = TestDataItem(id: '1', name: 'Updated Item 1');
  //     await fakeRepository.update(updatedItem);

  //     final updatedItems = await stream.skip(1).first;
  //     expect(updatedItems, contains(updatedItem));
  //   });
  // });
// }

// class TestDataItem extends DataItem<String> {
//   @override
//   final String id;
//   final String name;

//   TestDataItem({required this.id, required this.name});

//   @override
//   String getID() {
//     return id;
//   }
// }
