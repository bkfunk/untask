// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../motivations/models/motivation.dart';

extension ByTypeSetter on SharedPreferences {
  String getValueType(dynamic value) {
    if (value is bool) return "Bool";
    if (value is double) return "Double";
    if (value is int) return "Int";
    if (value is String) return "String";
    if (value is List<String>) return "List<String>";
    return value.runtimeType.toString();
  }

  Future<bool> setByType(String key, dynamic value) {
    switch (getValueType(value)) {
      case "Bool":
        return setBool(key, value);
      case "Double":
        return setDouble(key, value);
      case "Int":
        return setInt(key, value);
      case "String":
        return setString(key, value);
      case "List<String>":
        return setStringList(key, value);
      default:
        throw TypeError();
    }
  }
}

class Preferences {
  // The SharedPreferences options for field types are pretty limited: just
  // basic types like string and int.
  final Map<String, dynamic> _prefs;

  static const Map<String, dynamic> _defaults = {
    'motivationIDs': ['0', '1']
  };

  List<String> get keys => _prefs.keys.toList();
  List<MapEntry> get entries => _prefs.entries.toList();
  operator [](String key) => _prefs[key];

  Preferences({
    List<MotivationID>? motivationIDs,
  }) : _prefs = {'motivationIDs': motivationIDs ?? _defaults['motivationIDs']};

  Preferences.fromPrefs(Map<String, dynamic> prefs)
      : _prefs = _defaults.map(
          (key, defaultValue) => MapEntry(key, prefs[key] ?? defaultValue),
        );

  const Preferences.fromDefaults() : _prefs = _defaults;

  Preferences copyWith({
    List<MotivationID>? motivationIDs,
  }) {
    return Preferences(
      motivationIDs: motivationIDs ?? _prefs['motivationIDs'],
    );
  }

  Map<String, dynamic> toMap() {
    return _prefs;
  }

  factory Preferences.fromMap(Map<String, dynamic> map) {
    return Preferences.fromPrefs(map);
  }

  String toJson() => json.encode(toMap());

  factory Preferences.fromJson(String source) =>
      Preferences.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Preferences($_prefs)';

  @override
  bool operator ==(covariant Preferences other) {
    if (identical(this, other)) return true;

    return mapEquals(other._prefs, _prefs);
  }

  @override
  int get hashCode => _prefs.hashCode;

  SharedPreferences updateSharedPreferences(
    SharedPreferences sharedPrefs, {
    /// Whether to merge existing preferences
    // mergeExisting = false,

    /// Which fields to merge
    // Set<String> mergeFields = const <String>{},

    /// Which fields to not merge from sharedPrefs
    // Set<String> noMergeFields = const <String>{},
    overwriteExisting = true,
    Set<String> overwriteFields = const <String>{},
    Set<String> noOverwriteFields = const <String>{},
  }) {
    for (final MapEntry(:key, :value) in _prefs.entries) {
      // If overwriting AND this field is not specified as not being overwritten
      // OR if the field doesn't exist in the preferendes
      // OR not overwriting, but this field is listed as an exception
      if ((overwriteExisting && !noOverwriteFields.contains(key)) ||
          !sharedPrefs.containsKey(key) ||
          overwriteFields.contains(key)) {
        _saveFieldToSharedPreferences(sharedPrefs, key, value);
        // TODO: Implement merging
      }
    }
    return sharedPrefs;
  }

  static void _saveFieldToSharedPreferences(
      SharedPreferences sharedPrefs, String key, value) {
    sharedPrefs.setByType(key, value);
  }
}

// @Riverpod(keepAlive: true)
// Preferences preferences(PreferencesRef ref) {
//   return ref.read(currentAccountProvider);
// }
// @Riverpod(keepAlive: true)
// class Preferences extends _$Preferences {
//   @override
//   FutureOr<Map<String, dynamic>> build() {


//     return ;
//   }
// }

// @riverpod
// @riverpod
// class Preferences extends _$Preferences {
//   late final SharedPreferences _prefs;
//   // late final PreferencesRef ref;
//   @override
//   FutureOr<void> build(PreferencesRef ref) async {
//     _prefs = await SharedPreferences.getInstance();
//   }

//   Future<void> loadPreferencesFromAccountRepository(AccountID id) async {
//     state = const AsyncLoading();
//     state = await AsyncValue.guard(() async {
//       final Account? account =
//           ref.watch(accountsRepositoryProvider).getAccount(id);

//       if (account != null) {
//         _prefs.setString('account_id', account.id);
//       }
//     });
//   }
//   //   prefs.setString('account_id', account.id);
//   //   prefs.setStringList('motivationIDs', ["a"]);
//   //   // return prefs;
//   //   return prefs;
//   //   // return {"Hello": "World"};
//   // }
// }
