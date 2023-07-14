import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/motivation.dart';

abstract class MotivationsRepository {
  Motivation? getMotivation(MotivationID id);
  Stream<List<Motivation>> watchMotivationsList();
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

final motivationsRepositoryProvider = Provider<MotivationsRepository>((ref) {
  return FakeMotivationsRepository();
});

final motivationsListStreamProvider =
    StreamProvider.autoDispose<List<Motivation>>((ref) {
  final motivationsRepository = ref.watch(motivationsRepositoryProvider);
  return motivationsRepository.watchMotivationsList();
});

final motivationProvider =
    StreamProvider.autoDispose.family<Motivation?, MotivationID>((ref, id) {
  final motivationsRepository = ref.watch(motivationsRepositoryProvider);
  return motivationsRepository.watchMotivation(id);
});
