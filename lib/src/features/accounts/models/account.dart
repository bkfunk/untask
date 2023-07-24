// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:untask/src/features/accounts/data/accounts_repository.dart';

import 'preferences.dart';

part 'account.g.dart';

typedef AccountID = String;

class Account {
  final AccountID id;
  final Preferences prefs;
  // final List<MotivationID> motivationIDs;

  const Account({
    required this.id,
    this.prefs = const Preferences.fromDefaults(),
  });

  @override
  String toString() => 'Account(id: $id, prefs: $prefs)';

  @override
  bool operator ==(covariant Account other) {
    if (identical(this, other)) return true;

    return other.id == id && other.prefs == prefs;
  }

  @override
  int get hashCode => id.hashCode ^ prefs.hashCode;

  Account copyWith({
    AccountID? id,
    Preferences? prefs,
  }) {
    return Account(
      id: id ?? this.id,
      prefs: prefs ?? this.prefs,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'prefs': prefs.toMap(),
    };
  }

  factory Account.fromMap(Map<String, dynamic> map) {
    return Account(
      id: map['id'] as AccountID,
      prefs: Preferences.fromMap(map['prefs'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory Account.fromJson(String source) =>
      Account.fromMap(json.decode(source) as Map<String, dynamic>);
}

@riverpod
AccountID currentAccountID(CurrentAccountIDRef ref) {
  return "1";
}

@riverpod
AsyncValue<Account?> currentAccount(CurrentAccountRef ref) {
  final currentAccountID = ref.watch(currentAccountIDProvider);
  final currentAccount = ref.read(accountProvider(currentAccountID));
  return currentAccount;
  // if (currentAccount == null) {
  //   return AsyncValue.data(
  //       ref.read(accountsRepositoryProvider).createAccount(currentAccountID));
  // } else {
  //   return currentAccount;
  // }
}
