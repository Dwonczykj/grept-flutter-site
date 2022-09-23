import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vegisite/VegiRouter.dart';
import 'package:vegisite/common/di.dart';
import 'package:vegisite/constants.dart';
import 'package:vegisite/state_managers/app_state_manager.dart';
import 'package:vegisite/utils/colors_palette.dart' hide Colors;
import 'package:vegisite/utils/fire_auth.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  const env = 'prod';
  final envFile = env == 'prod' ? '.env' : '.env_$env';
  await dotenv.load(fileName: 'environment/$envFile');
  await configureDependencies(environment: isProd ? Env.prod : Env.dev);
  await FireAuth.initializeFirebaseApp();
  final state = AppStateManager(
    await SharedPreferences.getInstance(),
    smallVegiKey: GlobalKey(debugLabel: 'SmallChild-Vegi-TitleText'),
    largeVegiKey: GlobalKey(debugLabel: 'LargeChild-Vegi-TitleText'),
    smallVegiPayKey: GlobalKey(debugLabel: 'SmallChild-Vegi-Pay-TitleText'),
    largeVegiPayKey: GlobalKey(debugLabel: 'LargeChild-Vegi-Pay-TitleText'),
  );
  await state.checkLoggedIn();
  runApp(App(appStateManager: state));
}

class App extends StatelessWidget {
  App({Key? key, required this.appStateManager}) : super(key: key);

  final AppStateManager appStateManager;
  final smallVegiKey = GlobalKey(debugLabel: 'SmallChild-Vegi-TitleText');
  final largeVegiKey = GlobalKey(debugLabel: 'LargeChild-Vegi-TitleText');

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // ChangeNotifierProvider<SubscribedState>( //TODO: Add whether user has successfully subscribed to mailing list here
        //   lazy: false,
        //   create: (_) => SubscribedState(),
        // ),
        ChangeNotifierProvider(
          create: (context) => appStateManager,
        ),
        Provider<VegiRouter>(
          lazy: false,
          create: (BuildContext createContext) =>
              VegiRouter(appStateManager),
        ),
      ],
      child: Builder(builder: (context) {
        final router = Provider.of<VegiRouter>(context, listen: false).router;
        return MaterialApp.router(
          routeInformationParser: router.routeInformationParser,
          routerDelegate: router.routerDelegate,
          routeInformationProvider: router.routeInformationProvider,
          // routerConfig: router,
          title: 'vegiapp',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.lightGreen,
            backgroundColor: color1,
          ),
        );
      }),
    );
  }
}
