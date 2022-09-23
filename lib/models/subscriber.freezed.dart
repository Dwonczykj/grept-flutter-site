// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'subscriber.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Subscriber _$SubscriberFromJson(Map<String, dynamic> json) {
  return _Subscriber.fromJson(json);
}

/// @nodoc
mixin _$Subscriber {
  String get email => throw _privateConstructorUsedError;
  bool get isVerified => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SubscriberCopyWith<Subscriber> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubscriberCopyWith<$Res> {
  factory $SubscriberCopyWith(
          Subscriber value, $Res Function(Subscriber) then) =
      _$SubscriberCopyWithImpl<$Res>;
  $Res call({String email, bool isVerified});
}

/// @nodoc
class _$SubscriberCopyWithImpl<$Res> implements $SubscriberCopyWith<$Res> {
  _$SubscriberCopyWithImpl(this._value, this._then);

  final Subscriber _value;
  // ignore: unused_field
  final $Res Function(Subscriber) _then;

  @override
  $Res call({
    Object? email = freezed,
    Object? isVerified = freezed,
  }) {
    return _then(_value.copyWith(
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      isVerified: isVerified == freezed
          ? _value.isVerified
          : isVerified // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$$_SubscriberCopyWith<$Res>
    implements $SubscriberCopyWith<$Res> {
  factory _$$_SubscriberCopyWith(
          _$_Subscriber value, $Res Function(_$_Subscriber) then) =
      __$$_SubscriberCopyWithImpl<$Res>;
  @override
  $Res call({String email, bool isVerified});
}

/// @nodoc
class __$$_SubscriberCopyWithImpl<$Res> extends _$SubscriberCopyWithImpl<$Res>
    implements _$$_SubscriberCopyWith<$Res> {
  __$$_SubscriberCopyWithImpl(
      _$_Subscriber _value, $Res Function(_$_Subscriber) _then)
      : super(_value, (v) => _then(v as _$_Subscriber));

  @override
  _$_Subscriber get _value => super._value as _$_Subscriber;

  @override
  $Res call({
    Object? email = freezed,
    Object? isVerified = freezed,
  }) {
    return _then(_$_Subscriber(
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      isVerified: isVerified == freezed
          ? _value.isVerified
          : isVerified // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

@JsonSerializable()
class _$_Subscriber extends _Subscriber {
  _$_Subscriber({required this.email, required this.isVerified}) : super._();

  factory _$_Subscriber.fromJson(Map<String, dynamic> json) =>
      _$$_SubscriberFromJson(json);

  @override
  final String email;
  @override
  final bool isVerified;

  @override
  String toString() {
    return 'Subscriber(email: $email, isVerified: $isVerified)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Subscriber &&
            const DeepCollectionEquality().equals(other.email, email) &&
            const DeepCollectionEquality()
                .equals(other.isVerified, isVerified));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(email),
      const DeepCollectionEquality().hash(isVerified));

  @JsonKey(ignore: true)
  @override
  _$$_SubscriberCopyWith<_$_Subscriber> get copyWith =>
      __$$_SubscriberCopyWithImpl<_$_Subscriber>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SubscriberToJson(
      this,
    );
  }
}

abstract class _Subscriber extends Subscriber {
  factory _Subscriber(
      {required final String email,
      required final bool isVerified}) = _$_Subscriber;
  _Subscriber._() : super._();

  factory _Subscriber.fromJson(Map<String, dynamic> json) =
      _$_Subscriber.fromJson;

  @override
  String get email;
  @override
  bool get isVerified;
  @override
  @JsonKey(ignore: true)
  _$$_SubscriberCopyWith<_$_Subscriber> get copyWith =>
      throw _privateConstructorUsedError;
}
