// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'motivation.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Motivation _$MotivationFromJson(Map<String, dynamic> json) {
  return _Motivation.fromJson(json);
}

/// @nodoc
mixin _$Motivation {
  String? get id => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MotivationCopyWith<Motivation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MotivationCopyWith<$Res> {
  factory $MotivationCopyWith(
          Motivation value, $Res Function(Motivation) then) =
      _$MotivationCopyWithImpl<$Res, Motivation>;
  @useResult
  $Res call({String? id, String description});
}

/// @nodoc
class _$MotivationCopyWithImpl<$Res, $Val extends Motivation>
    implements $MotivationCopyWith<$Res> {
  _$MotivationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? description = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MotivationImplCopyWith<$Res>
    implements $MotivationCopyWith<$Res> {
  factory _$$MotivationImplCopyWith(
          _$MotivationImpl value, $Res Function(_$MotivationImpl) then) =
      __$$MotivationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? id, String description});
}

/// @nodoc
class __$$MotivationImplCopyWithImpl<$Res>
    extends _$MotivationCopyWithImpl<$Res, _$MotivationImpl>
    implements _$$MotivationImplCopyWith<$Res> {
  __$$MotivationImplCopyWithImpl(
      _$MotivationImpl _value, $Res Function(_$MotivationImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? description = null,
  }) {
    return _then(_$MotivationImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MotivationImpl implements _Motivation {
  _$MotivationImpl({this.id, required this.description});

  factory _$MotivationImpl.fromJson(Map<String, dynamic> json) =>
      _$$MotivationImplFromJson(json);

  @override
  final String? id;
  @override
  final String description;

  @override
  String toString() {
    return 'Motivation(id: $id, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MotivationImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, description);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MotivationImplCopyWith<_$MotivationImpl> get copyWith =>
      __$$MotivationImplCopyWithImpl<_$MotivationImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MotivationImplToJson(
      this,
    );
  }
}

abstract class _Motivation implements Motivation {
  factory _Motivation({final String? id, required final String description}) =
      _$MotivationImpl;

  factory _Motivation.fromJson(Map<String, dynamic> json) =
      _$MotivationImpl.fromJson;

  @override
  String? get id;
  @override
  String get description;
  @override
  @JsonKey(ignore: true)
  _$$MotivationImplCopyWith<_$MotivationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
