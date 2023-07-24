import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/motivation.dart';

part 'motivations_repository.g.dart';

abstract class MotivationsRepository {
  Motivation? getMotivation(MotivationID id);
  Stream<List<Motivation>> watchMotivationsList();
  Future<List<Motivation>> fetchMotivationsList();
  Stream<Motivation?> watchMotivation(MotivationID id);
}

class FakeMotivationsRepository implements MotivationsRepository {
  static List<Motivation> fakeMotivations = [
    Motivation('0', "Help my family"),
    Motivation('1', "Tend to my health"),
  ];

  @override
  Motivation? getMotivation(MotivationID id) {
    return _getMotivation(fakeMotivations, id);
  }

  @override
  Stream<List<Motivation>> watchMotivationsList() async* {
    yield fakeMotivations;
  }

  @override
  Future<List<Motivation>> fetchMotivationsList() async {
    return Future.value(fakeMotivations);
  }

  @override
  Stream<Motivation?> watchMotivation(MotivationID id) {
    return watchMotivationsList()
        .map((motivations) => _getMotivation(motivations, id));
  }

  static Motivation? _getMotivation(
      List<Motivation> motivations, MotivationID id) {
    try {
      return motivations.firstWhere((element) => element.id == id);
    } catch (e) {
      return null;
    }
  }
}

@riverpod
MotivationsRepository motivationsRepository(MotivationsRepositoryRef ref) {
  return FakeMotivationsRepository();
}

final motivationsListStreamProvider =
    StreamProvider.autoDispose<List<Motivation>>((ref) {
  final motivationsRepository = ref.watch(motivationsRepositoryProvider);
  return motivationsRepository.watchMotivationsList();
});

@riverpod
Future<List<Motivation>> motivationsList(MotivationsListRef ref) {
  final motivationsRepository = ref.watch(motivationsRepositoryProvider);
  return motivationsRepository.fetchMotivationsList();
}

final motivationProvider =
    StreamProvider.autoDispose.family<Motivation?, MotivationID>((ref, id) {
  final motivationsRepository = ref.watch(motivationsRepositoryProvider);
  return motivationsRepository.watchMotivation(id);
});
