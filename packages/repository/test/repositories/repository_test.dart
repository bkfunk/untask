import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:repository/data_items/data_item.dart';
import 'package:repository/repositories/fake.dart';

class DataItemImpl implements DataItem<String> {
  @override
  final String id;
  final String name;

  DataItemImpl({required this.id, required this.name});

  @override
  String toString() {
    return 'DataItemImpl(id: $id, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is DataItemImpl && other.id == id && other.name == name;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode;

  static List<DataItemImpl> defaultList() {
    return [
      DataItemImpl(id: '1', name: 'Item 1'),
      DataItemImpl(id: '2', name: 'Item 2'),
      DataItemImpl(id: '3', name: 'Item 3'),
    ];
  }
}

class FakeRepositoryImpl extends FakeRepository<DataItemImpl, String> {
  FakeRepositoryImpl({super.delay})
      : super(fakeItems: DataItemImpl.defaultList());
}

void main() {
  final repo = FakeRepositoryImpl();

  test('FakeRepositoryImpl has correct fakeItems list', () async {
    final expectedItems = DataItemImpl.defaultList();

    expect(await repo.getAll(), equals(expectedItems));
  });

  test('FakeRepositoryImpl can get an item by ID', () async {
    final item = await repo.get('2');

    expect(item, isNotNull);
    expect(item!.id, equals('2'));
    expect(item.name, equals('Item 2'));
  });

  test('FakeRepositoryImpl can insert an item', () async {
    final newItem = DataItemImpl(id: '4', name: 'Item 4');

    final startItems = await repo.getAll();
    debugPrint("Starting Items: $startItems");
    expect(startItems, isNot(contains(newItem)));

    await repo.insert(newItem);

    // final items = repo.getList();
    final endItems = await repo.getAll();
    debugPrint("Ending items: $endItems");

    expect(endItems, contains(newItem));
  });
}
