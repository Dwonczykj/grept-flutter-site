import 'package:freezed_annotation/freezed_annotation.dart';

part 'subscriber.freezed.dart';
part 'subscriber.g.dart';

@Freezed()
class Subscriber with _$Subscriber {
  factory Subscriber.fromJson(Map<String, dynamic> json) =>
      _$SubscriberFromJson(json);

  const Subscriber._();

  @JsonSerializable()
  factory Subscriber({
    required String email,
    required bool isVerified,
  }) = _Subscriber;

  factory Subscriber.initial() => Subscriber(
        email: '',
        isVerified: false,
      );
}
