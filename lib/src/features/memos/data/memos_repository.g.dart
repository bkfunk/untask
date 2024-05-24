// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'memos_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$memosRepositoryHash() => r'cccce8ffde20f2e678c1eb58df6e2259072c0fa7';

/// See also [memosRepository].
@ProviderFor(memosRepository)
final memosRepositoryProvider = AutoDisposeProvider<MemosRepository>.internal(
  memosRepository,
  name: r'memosRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$memosRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef MemosRepositoryRef = AutoDisposeProviderRef<MemosRepository>;
String _$memosStreamHash() => r'67989565611be00d06ef4ea9cea2006b68668d23';

/// See also [memosStream].
@ProviderFor(memosStream)
final memosStreamProvider = AutoDisposeStreamProvider<List<Memo>>.internal(
  memosStream,
  name: r'memosStreamProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$memosStreamHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef MemosStreamRef = AutoDisposeStreamProviderRef<List<Memo>>;
String _$memoFutureHash() => r'50c9ba11ff435fc5ca7b6ae50ac973cd48cdbf26';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [memoFuture].
@ProviderFor(memoFuture)
const memoFutureProvider = MemoFutureFamily();

/// See also [memoFuture].
class MemoFutureFamily extends Family<AsyncValue<Memo?>> {
  /// See also [memoFuture].
  const MemoFutureFamily();

  /// See also [memoFuture].
  MemoFutureProvider call(
    String id,
  ) {
    return MemoFutureProvider(
      id,
    );
  }

  @override
  MemoFutureProvider getProviderOverride(
    covariant MemoFutureProvider provider,
  ) {
    return call(
      provider.id,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'memoFutureProvider';
}

/// See also [memoFuture].
class MemoFutureProvider extends AutoDisposeFutureProvider<Memo?> {
  /// See also [memoFuture].
  MemoFutureProvider(
    String id,
  ) : this._internal(
          (ref) => memoFuture(
            ref as MemoFutureRef,
            id,
          ),
          from: memoFutureProvider,
          name: r'memoFutureProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$memoFutureHash,
          dependencies: MemoFutureFamily._dependencies,
          allTransitiveDependencies:
              MemoFutureFamily._allTransitiveDependencies,
          id: id,
        );

  MemoFutureProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final String id;

  @override
  Override overrideWith(
    FutureOr<Memo?> Function(MemoFutureRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: MemoFutureProvider._internal(
        (ref) => create(ref as MemoFutureRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Memo?> createElement() {
    return _MemoFutureProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is MemoFutureProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin MemoFutureRef on AutoDisposeFutureProviderRef<Memo?> {
  /// The parameter `id` of this provider.
  String get id;
}

class _MemoFutureProviderElement extends AutoDisposeFutureProviderElement<Memo?>
    with MemoFutureRef {
  _MemoFutureProviderElement(super.provider);

  @override
  String get id => (origin as MemoFutureProvider).id;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
