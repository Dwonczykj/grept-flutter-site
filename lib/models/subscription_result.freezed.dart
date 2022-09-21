// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'subscription_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SubscriptionResult _$SubscriptionResultFromJson(Map<String, dynamic> json) {
  return _SubscriptionResult.fromJson(json);
}

/// @nodoc
mixin _$SubscriptionResult {
  String get error => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SubscriptionResultCopyWith<SubscriptionResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubscriptionResultCopyWith<$Res> {
  factory $SubscriptionResultCopyWith(
          SubscriptionResult value, $Res Function(SubscriptionResult) then) =
      _$SubscriptionResultCopyWithImpl<$Res>;
  $Res call({String error, String email});
}

/// @nodoc
class _$SubscriptionResultCopyWithImpl<$Res>
    implements $SubscriptionResultCopyWith<$Res> {
  _$SubscriptionResultCopyWithImpl(this._value, this._then);

  final SubscriptionResult _value;
  // ignore: unused_field
  final $Res Function(SubscriptionResult) _then;

  @override
  $Res call({
    Object? error = freezed,
    Object? email = freezed,
  }) {
    return _then(_value.copyWith(
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_SubscriptionResultCopyWith<$Res>
    implements $SubscriptionResultCopyWith<$Res> {
  factory _$$_SubscriptionResultCopyWith(_$_SubscriptionResult value,
          $Res Function(_$_SubscriptionResult) then) =
      __$$_SubscriptionResultCopyWithImpl<$Res>;
  @override
  $Res call({String error, String email});
}

/// @nodoc
class __$$_SubscriptionResultCopyWithImpl<$Res>
    extends _$SubscriptionResultCopyWithImpl<$Res>
    implements _$$_SubscriptionResultCopyWith<$Res> {
  __$$_SubscriptionResultCopyWithImpl(
      _$_SubscriptionResult _value, $Res Function(_$_SubscriptionResult) _then)
      : super(_value, (v) => _then(v as _$_SubscriptionResult));

  @override
  _$_SubscriptionResult get _value => super._value as _$_SubscriptionResult;

  @override
  $Res call({
    Object? error = freezed,
    Object? email = freezed,
  }) {
    return _then(_$_SubscriptionResult(
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable()
class _$_SubscriptionResult extends _SubscriptionResult {
  _$_SubscriptionResult({this.error = '', required this.email}) : super._();

  factory _$_SubscriptionResult.fromJson(Map<String, dynamic> json) =>
      _$$_SubscriptionResultFromJson(json);

  @override
  @JsonKey()
  final String error;
  @override
  final String email;

  @override
  String toString() {
    return 'SubscriptionResult(error: $error, email: $email)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SubscriptionResult &&
            const DeepCollectionEquality().equals(other.error, error) &&
            const DeepCollectionEquality().equals(other.email, email));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(error),
      const DeepCollectionEquality().hash(email));

  @JsonKey(ignore: true)
  @override
  _$$_SubscriptionResultCopyWith<_$_SubscriptionResult> get copyWith =>
      __$$_SubscriptionResultCopyWithImpl<_$_SubscriptionResult>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SubscriptionResultToJson(
      this,
    );
  }
}

abstract class _SubscriptionResult extends SubscriptionResult {
  factory _SubscriptionResult(
      {final String error,
      required final String email}) = _$_SubscriptionResult;
  _SubscriptionResult._() : super._();

  factory _SubscriptionResult.fromJson(Map<String, dynamic> json) =
      _$_SubscriptionResult.fromJson;

  @override
  String get error;
  @override
  String get email;
  @override
  @JsonKey(ignore: true)
  _$$_SubscriptionResultCopyWith<_$_SubscriptionResult> get copyWith =>
      throw _privateConstructorUsedError;
}
