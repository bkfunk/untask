import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/account.dart';
import '../models/preferences.dart';

part 'accounts_repository.g.dart';

abstract class AccountsRepository {
  Future<Account?> getAccount(AccountID id);
  // TODO: Change the return type once accounts might not exist
  Future<Account> createAccount(AccountID id);
}

class FakeAccountsRepository implements AccountsRepository {
  static List<Account> fakeAccounts = [
    const Account(id: '0'),
    Account(id: '1', prefs: Preferences(motivationIDs: ['1'])),
  ];

  @override
  Future<Account?> getAccount(AccountID id) async {
    return Future.value(
        fakeAccounts.where((account) => account.id == id).firstOrNull);
  }

  @override
  Future<Account> createAccount(AccountID id) {
    // TODO: Actually create an account
    return Future.value(const Account(id: "foo"));
  }
}

@Riverpod(keepAlive: true)
AccountsRepository accountsRepository(AccountsRepositoryRef ref) {
  return FakeAccountsRepository();
}

// @Riverpod(keepAlive: true)
@riverpod
Future<Account?> account(AccountRef ref, AccountID id) async {
  return ref.watch(accountsRepositoryProvider).getAccount(id);
}

// @riverpod
// Account? account(AccountRef ref, AccountID id) {
//   return null;
// }
