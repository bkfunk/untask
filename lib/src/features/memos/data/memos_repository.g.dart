// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'memos_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$memosRepositoryHash() => r'fae63b23323557af8e0343c74a4b53af6b8f18da';

/// See also [memosRepository].
@ProviderFor(memosRepository)
final memosRepositoryProvider =
    AutoDisposeProvider<FakeMemosRepository>.internal(
  memosRepository,
  name: r'memosRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$memosRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef MemosRepositoryRef = AutoDisposeProviderRef<FakeMemosRepository>;
String _$allMemosHash() => r'8138ec930a6d98e16185681ef7c202e6ea65b1a4';

/// See also [allMemos].
@ProviderFor(allMemos)
final allMemosProvider = AutoDisposeStreamProvider<Memo>.internal(
  allMemos,
  name: r'allMemosProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$allMemosHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AllMemosRef = AutoDisposeStreamProviderRef<Memo>;
String _$fetchMemosListHash() => r'1cbdced622522a9b74bfeaed8dcb138d1229db27';

/// See also [fetchMemosList].
@ProviderFor(fetchMemosList)
final fetchMemosListProvider = AutoDisposeFutureProvider<List<Memo>>.internal(
  fetchMemosList,
  name: r'fetchMemosListProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$fetchMemosListHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FetchMemosListRef = AutoDisposeFutureProviderRef<List<Memo>>;
String _$fakeMemosRepositoryHash() =>
    r'1ba8ca621da595125da32308418ad777aaa2eec5';

/// See also [FakeMemosRepository].
@ProviderFor(FakeMemosRepository)
final fakeMemosRepositoryProvider =
    AutoDisposeAsyncNotifierProvider<FakeMemosRepository, List<Memo>>.internal(
  FakeMemosRepository.new,
  name: r'fakeMemosRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$fakeMemosRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$FakeMemosRepository = AutoDisposeAsyncNotifier<List<Memo>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
