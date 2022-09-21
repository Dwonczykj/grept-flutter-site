import 'package:freezed_annotation/freezed_annotation.dart';

part 'subscription_result.freezed.dart';
part 'subscription_result.g.dart';

@Freezed()
class SubscriptionResult with _$SubscriptionResult {
  factory SubscriptionResult.fromJson(Map<String, dynamic> json) =>
      _$SubscriptionResultFromJson(json);

  const SubscriptionResult._();

  @JsonSerializable()
  factory SubscriptionResult({
    @Default('') String error,
    required String email,
  }) = _SubscriptionResult;

  factory SubscriptionResult.userAlreadyExists(String email) =>
      SubscriptionResult(
        error: 'Email address already subscribed',
        email: email,
      );

  factory SubscriptionResult.userNotSubscribed(String email) =>
      SubscriptionResult(
        error: 'Email is not subscribed',
        email: email,
      );
}
