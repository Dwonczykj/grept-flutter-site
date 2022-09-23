import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';
import 'package:vegisite/common/di.dart';
import 'package:vegisite/services/network/slack_api.dart';

final GoRouter rootRouter = getIt<GoRouter>();

@Environment(Env.prod)
@Environment(Env.dev)
@Environment(Env.test)
final ISendSlackMessages slackMessagingService = getIt<SlackMessager>();
