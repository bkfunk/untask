// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'accounts_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$accountsRepositoryHash() =>
    r'be9bc5c798fca908dc3496a0163654c1bc448325';

/// See also [accountsRepository].
@ProviderFor(accountsRepository)
final accountsRepositoryProvider = Provider<AccountsRepository>.internal(
  accountsRepository,
  name: r'accountsRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$accountsRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AccountsRepositoryRef = ProviderRef<AccountsRepository>;
String _$accountHash() => r'04a189b1770584b67ae78b5edf03fdd4c9fbfeea';

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

typedef AccountRef = AutoDisposeFutureProviderRef<Account?>;

/// See also [account].
@ProviderFor(account)
const accountProvider = AccountFamily();

/// See also [account].
class AccountFamily extends Family<AsyncValue<Account?>> {
  /// See also [account].
  const AccountFamily();

  /// See also [account].
  AccountProvider call(
    String id,
  ) {
    return AccountProvider(
      id,
    );
  }

  @override
  AccountProvider getProviderOverride(
    covariant AccountProvider provider,
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
  String? get name => r'accountProvider';
}

/// See also [account].
class AccountProvider extends AutoDisposeFutureProvider<Account?> {
  /// See also [account].
  AccountProvider(
    this.id,
  ) : super.internal(
          (ref) => account(
            ref,
            id,
          ),
          from: accountProvider,
          name: r'accountProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$accountHash,
          dependencies: AccountFamily._dependencies,
          allTransitiveDependencies: AccountFamily._allTransitiveDependencies,
        );

  final String id;

  @override
  bool operator ==(Object other) {
    return other is AccountProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
