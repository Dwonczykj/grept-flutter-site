import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:vegisite/constants.dart';
import 'package:vegisite/services/network/abstract_apis/httpService.dart';

abstract class ISendSlackMessages extends HttpService {
  ISendSlackMessages(this.dio) : super(dio, slackApi);
  final Dio dio;
  void sendMessage(String message) {}
}

class SlackMessager extends ISendSlackMessages {
  SlackMessager(Dio dio) : super(dio) {
    this.dio.options.headers = Map.from({"Content-Type": 'application/json'});
  }
  @override
  void sendMessage(String message) async {
    final messageData = <String, dynamic>{
      "channel": dotenv.env["SLACK_CHANNEL_ID"],
      "text": message
    };
    await dio.post('chat.postMessage', data: messageData);
  }
}
