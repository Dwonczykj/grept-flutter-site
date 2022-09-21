// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subscription_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SubscriptionResult _$$_SubscriptionResultFromJson(
        Map<String, dynamic> json) =>
    _$_SubscriptionResult(
      error: json['error'] as String? ?? '',
      email: json['email'] as String,
    );

Map<String, dynamic> _$$_SubscriptionResultToJson(
        _$_SubscriptionResult instance) =>
    <String, dynamic>{
      'error': instance.error,
      'email': instance.email,
    };
