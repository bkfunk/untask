// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'isar_memo.dart';

// **************************************************************************
// _IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, invalid_use_of_protected_member, lines_longer_than_80_chars, constant_identifier_names, avoid_js_rounded_ints, no_leading_underscores_for_local_identifiers, require_trailing_commas, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_in_if_null_operators, library_private_types_in_public_api, prefer_const_constructors
// ignore_for_file: type=lint

extension GetIsarMemoCollection on Isar {
  IsarCollection<int, IsarMemo> get isarMemos => this.collection();
}

const IsarMemoSchema = IsarGeneratedSchema(
  schema: IsarSchema(
    name: 'IsarMemo',
    idName: 'id',
    embedded: false,
    properties: [
      IsarPropertySchema(
        name: 'memoID',
        type: IsarType.string,
      ),
      IsarPropertySchema(
        name: 'createdAt',
        type: IsarType.dateTime,
      ),
      IsarPropertySchema(
        name: 'title',
        type: IsarType.string,
      ),
    ],
    indexes: [
      IsarIndexSchema(
        name: 'memoID',
        properties: [
          "memoID",
        ],
        unique: true,
        hash: false,
      ),
    ],
  ),
  converter: IsarObjectConverter<int, IsarMemo>(
    serialize: serializeIsarMemo,
    deserialize: deserializeIsarMemo,
    deserializeProperty: deserializeIsarMemoProp,
  ),
  embeddedSchemas: [],
);

@isarProtected
int serializeIsarMemo(IsarWriter writer, IsarMemo object) {
  IsarCore.writeString(writer, 1, object.memoID);
  IsarCore.writeLong(
      writer, 2, object.createdAt.toUtc().microsecondsSinceEpoch);
  IsarCore.writeString(writer, 3, object.title);
  return object.id;
}

@isarProtected
IsarMemo deserializeIsarMemo(IsarReader reader) {
  final int _id;
  _id = IsarCore.readId(reader);
  final String _memoID;
  _memoID = IsarCore.readString(reader, 1) ?? '';
  final DateTime _createdAt;
  {
    final value = IsarCore.readLong(reader, 2);
    if (value == -9223372036854775808) {
      _createdAt =
          DateTime.fromMillisecondsSinceEpoch(0, isUtc: true).toLocal();
    } else {
      _createdAt =
          DateTime.fromMicrosecondsSinceEpoch(value, isUtc: true).toLocal();
    }
  }
  final String _title;
  _title = IsarCore.readString(reader, 3) ?? '';
  final object = IsarMemo(
    id: _id,
    memoID: _memoID,
    createdAt: _createdAt,
    title: _title,
  );
  return object;
}

@isarProtected
dynamic deserializeIsarMemoProp(IsarReader reader, int property) {
  switch (property) {
    case 0:
      return IsarCore.readId(reader);
    case 1:
      return IsarCore.readString(reader, 1) ?? '';
    case 2:
      {
        final value = IsarCore.readLong(reader, 2);
        if (value == -9223372036854775808) {
          return DateTime.fromMillisecondsSinceEpoch(0, isUtc: true).toLocal();
        } else {
          return DateTime.fromMicrosecondsSinceEpoch(value, isUtc: true)
              .toLocal();
        }
      }
    case 3:
      return IsarCore.readString(reader, 3) ?? '';
    default:
      throw ArgumentError('Unknown property: $property');
  }
}

sealed class _IsarMemoUpdate {
  bool call({
    required int id,
    String? memoID,
    DateTime? createdAt,
    String? title,
  });
}

class _IsarMemoUpdateImpl implements _IsarMemoUpdate {
  const _IsarMemoUpdateImpl(this.collection);

  final IsarCollection<int, IsarMemo> collection;

  @override
  bool call({
    required int id,
    Object? memoID = ignore,
    Object? createdAt = ignore,
    Object? title = ignore,
  }) {
    return collection.updateProperties([
          id
        ], {
          if (memoID != ignore) 1: memoID as String?,
          if (createdAt != ignore) 2: createdAt as DateTime?,
          if (title != ignore) 3: title as String?,
        }) >
        0;
  }
}

sealed class _IsarMemoUpdateAll {
  int call({
    required List<int> id,
    String? memoID,
    DateTime? createdAt,
    String? title,
  });
}

class _IsarMemoUpdateAllImpl implements _IsarMemoUpdateAll {
  const _IsarMemoUpdateAllImpl(this.collection);

  final IsarCollection<int, IsarMemo> collection;

  @override
  int call({
    required List<int> id,
    Object? memoID = ignore,
    Object? createdAt = ignore,
    Object? title = ignore,
  }) {
    return collection.updateProperties(id, {
      if (memoID != ignore) 1: memoID as String?,
      if (createdAt != ignore) 2: createdAt as DateTime?,
      if (title != ignore) 3: title as String?,
    });
  }
}

extension IsarMemoUpdate on IsarCollection<int, IsarMemo> {
  _IsarMemoUpdate get update => _IsarMemoUpdateImpl(this);

  _IsarMemoUpdateAll get updateAll => _IsarMemoUpdateAllImpl(this);
}

sealed class _IsarMemoQueryUpdate {
  int call({
    String? memoID,
    DateTime? createdAt,
    String? title,
  });
}

class _IsarMemoQueryUpdateImpl implements _IsarMemoQueryUpdate {
  const _IsarMemoQueryUpdateImpl(this.query, {this.limit});

  final IsarQuery<IsarMemo> query;
  final int? limit;

  @override
  int call({
    Object? memoID = ignore,
    Object? createdAt = ignore,
    Object? title = ignore,
  }) {
    return query.updateProperties(limit: limit, {
      if (memoID != ignore) 1: memoID as String?,
      if (createdAt != ignore) 2: createdAt as DateTime?,
      if (title != ignore) 3: title as String?,
    });
  }
}

extension IsarMemoQueryUpdate on IsarQuery<IsarMemo> {
  _IsarMemoQueryUpdate get updateFirst =>
      _IsarMemoQueryUpdateImpl(this, limit: 1);

  _IsarMemoQueryUpdate get updateAll => _IsarMemoQueryUpdateImpl(this);
}

class _IsarMemoQueryBuilderUpdateImpl implements _IsarMemoQueryUpdate {
  const _IsarMemoQueryBuilderUpdateImpl(this.query, {this.limit});

  final QueryBuilder<IsarMemo, IsarMemo, QOperations> query;
  final int? limit;

  @override
  int call({
    Object? memoID = ignore,
    Object? createdAt = ignore,
    Object? title = ignore,
  }) {
    final q = query.build();
    try {
      return q.updateProperties(limit: limit, {
        if (memoID != ignore) 1: memoID as String?,
        if (createdAt != ignore) 2: createdAt as DateTime?,
        if (title != ignore) 3: title as String?,
      });
    } finally {
      q.close();
    }
  }
}

extension IsarMemoQueryBuilderUpdate
    on QueryBuilder<IsarMemo, IsarMemo, QOperations> {
  _IsarMemoQueryUpdate get updateFirst =>
      _IsarMemoQueryBuilderUpdateImpl(this, limit: 1);

  _IsarMemoQueryUpdate get updateAll => _IsarMemoQueryBuilderUpdateImpl(this);
}

extension IsarMemoQueryFilter
    on QueryBuilder<IsarMemo, IsarMemo, QFilterCondition> {
  QueryBuilder<IsarMemo, IsarMemo, QAfterFilterCondition> idEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 0,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<IsarMemo, IsarMemo, QAfterFilterCondition> idGreaterThan(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 0,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<IsarMemo, IsarMemo, QAfterFilterCondition>
      idGreaterThanOrEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 0,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<IsarMemo, IsarMemo, QAfterFilterCondition> idLessThan(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 0,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<IsarMemo, IsarMemo, QAfterFilterCondition> idLessThanOrEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 0,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<IsarMemo, IsarMemo, QAfterFilterCondition> idBetween(
    int lower,
    int upper,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 0,
          lower: lower,
          upper: upper,
        ),
      );
    });
  }

  QueryBuilder<IsarMemo, IsarMemo, QAfterFilterCondition> memoIDEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarMemo, IsarMemo, QAfterFilterCondition> memoIDGreaterThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarMemo, IsarMemo, QAfterFilterCondition>
      memoIDGreaterThanOrEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarMemo, IsarMemo, QAfterFilterCondition> memoIDLessThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarMemo, IsarMemo, QAfterFilterCondition>
      memoIDLessThanOrEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarMemo, IsarMemo, QAfterFilterCondition> memoIDBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 1,
          lower: lower,
          upper: upper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarMemo, IsarMemo, QAfterFilterCondition> memoIDStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        StartsWithCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarMemo, IsarMemo, QAfterFilterCondition> memoIDEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EndsWithCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarMemo, IsarMemo, QAfterFilterCondition> memoIDContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        ContainsCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarMemo, IsarMemo, QAfterFilterCondition> memoIDMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        MatchesCondition(
          property: 1,
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarMemo, IsarMemo, QAfterFilterCondition> memoIDIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const EqualCondition(
          property: 1,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<IsarMemo, IsarMemo, QAfterFilterCondition> memoIDIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const GreaterCondition(
          property: 1,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<IsarMemo, IsarMemo, QAfterFilterCondition> createdAtEqualTo(
    DateTime value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 2,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<IsarMemo, IsarMemo, QAfterFilterCondition> createdAtGreaterThan(
    DateTime value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 2,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<IsarMemo, IsarMemo, QAfterFilterCondition>
      createdAtGreaterThanOrEqualTo(
    DateTime value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 2,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<IsarMemo, IsarMemo, QAfterFilterCondition> createdAtLessThan(
    DateTime value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 2,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<IsarMemo, IsarMemo, QAfterFilterCondition>
      createdAtLessThanOrEqualTo(
    DateTime value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 2,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<IsarMemo, IsarMemo, QAfterFilterCondition> createdAtBetween(
    DateTime lower,
    DateTime upper,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 2,
          lower: lower,
          upper: upper,
        ),
      );
    });
  }

  QueryBuilder<IsarMemo, IsarMemo, QAfterFilterCondition> titleEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 3,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarMemo, IsarMemo, QAfterFilterCondition> titleGreaterThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 3,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarMemo, IsarMemo, QAfterFilterCondition>
      titleGreaterThanOrEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 3,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarMemo, IsarMemo, QAfterFilterCondition> titleLessThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 3,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarMemo, IsarMemo, QAfterFilterCondition>
      titleLessThanOrEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 3,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarMemo, IsarMemo, QAfterFilterCondition> titleBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 3,
          lower: lower,
          upper: upper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarMemo, IsarMemo, QAfterFilterCondition> titleStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        StartsWithCondition(
          property: 3,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarMemo, IsarMemo, QAfterFilterCondition> titleEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EndsWithCondition(
          property: 3,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarMemo, IsarMemo, QAfterFilterCondition> titleContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        ContainsCondition(
          property: 3,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarMemo, IsarMemo, QAfterFilterCondition> titleMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        MatchesCondition(
          property: 3,
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarMemo, IsarMemo, QAfterFilterCondition> titleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const EqualCondition(
          property: 3,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<IsarMemo, IsarMemo, QAfterFilterCondition> titleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const GreaterCondition(
          property: 3,
          value: '',
        ),
      );
    });
  }
}

extension IsarMemoQueryObject
    on QueryBuilder<IsarMemo, IsarMemo, QFilterCondition> {}

extension IsarMemoQuerySortBy on QueryBuilder<IsarMemo, IsarMemo, QSortBy> {
  QueryBuilder<IsarMemo, IsarMemo, QAfterSortBy> sortById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(0);
    });
  }

  QueryBuilder<IsarMemo, IsarMemo, QAfterSortBy> sortByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(0, sort: Sort.desc);
    });
  }

  QueryBuilder<IsarMemo, IsarMemo, QAfterSortBy> sortByMemoID(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        1,
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<IsarMemo, IsarMemo, QAfterSortBy> sortByMemoIDDesc(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        1,
        sort: Sort.desc,
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<IsarMemo, IsarMemo, QAfterSortBy> sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(2);
    });
  }

  QueryBuilder<IsarMemo, IsarMemo, QAfterSortBy> sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(2, sort: Sort.desc);
    });
  }

  QueryBuilder<IsarMemo, IsarMemo, QAfterSortBy> sortByTitle(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        3,
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<IsarMemo, IsarMemo, QAfterSortBy> sortByTitleDesc(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        3,
        sort: Sort.desc,
        caseSensitive: caseSensitive,
      );
    });
  }
}

extension IsarMemoQuerySortThenBy
    on QueryBuilder<IsarMemo, IsarMemo, QSortThenBy> {
  QueryBuilder<IsarMemo, IsarMemo, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(0);
    });
  }

  QueryBuilder<IsarMemo, IsarMemo, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(0, sort: Sort.desc);
    });
  }

  QueryBuilder<IsarMemo, IsarMemo, QAfterSortBy> thenByMemoID(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(1, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<IsarMemo, IsarMemo, QAfterSortBy> thenByMemoIDDesc(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(1, sort: Sort.desc, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<IsarMemo, IsarMemo, QAfterSortBy> thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(2);
    });
  }

  QueryBuilder<IsarMemo, IsarMemo, QAfterSortBy> thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(2, sort: Sort.desc);
    });
  }

  QueryBuilder<IsarMemo, IsarMemo, QAfterSortBy> thenByTitle(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(3, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<IsarMemo, IsarMemo, QAfterSortBy> thenByTitleDesc(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(3, sort: Sort.desc, caseSensitive: caseSensitive);
    });
  }
}

extension IsarMemoQueryWhereDistinct
    on QueryBuilder<IsarMemo, IsarMemo, QDistinct> {
  QueryBuilder<IsarMemo, IsarMemo, QAfterDistinct> distinctByMemoID(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(1, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<IsarMemo, IsarMemo, QAfterDistinct> distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(2);
    });
  }

  QueryBuilder<IsarMemo, IsarMemo, QAfterDistinct> distinctByTitle(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(3, caseSensitive: caseSensitive);
    });
  }
}

extension IsarMemoQueryProperty1
    on QueryBuilder<IsarMemo, IsarMemo, QProperty> {
  QueryBuilder<IsarMemo, int, QAfterProperty> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(0);
    });
  }

  QueryBuilder<IsarMemo, String, QAfterProperty> memoIDProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(1);
    });
  }

  QueryBuilder<IsarMemo, DateTime, QAfterProperty> createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(2);
    });
  }

  QueryBuilder<IsarMemo, String, QAfterProperty> titleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(3);
    });
  }
}

extension IsarMemoQueryProperty2<R>
    on QueryBuilder<IsarMemo, R, QAfterProperty> {
  QueryBuilder<IsarMemo, (R, int), QAfterProperty> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(0);
    });
  }

  QueryBuilder<IsarMemo, (R, String), QAfterProperty> memoIDProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(1);
    });
  }

  QueryBuilder<IsarMemo, (R, DateTime), QAfterProperty> createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(2);
    });
  }

  QueryBuilder<IsarMemo, (R, String), QAfterProperty> titleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(3);
    });
  }
}

extension IsarMemoQueryProperty3<R1, R2>
    on QueryBuilder<IsarMemo, (R1, R2), QAfterProperty> {
  QueryBuilder<IsarMemo, (R1, R2, int), QOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(0);
    });
  }

  QueryBuilder<IsarMemo, (R1, R2, String), QOperations> memoIDProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(1);
    });
  }

  QueryBuilder<IsarMemo, (R1, R2, DateTime), QOperations> createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(2);
    });
  }

  QueryBuilder<IsarMemo, (R1, R2, String), QOperations> titleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(3);
    });
  }
}
