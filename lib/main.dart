import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vegisite/common/di.dart';
import 'package:vegisite/constants.dart';
import 'package:vegisite/features/get_vegi/download_vegi_appstore.dart';
import 'package:vegisite/features/get_vegi/get_vegi_screen.dart';
import 'package:vegisite/features/home/vegi_app_body_widget.dart';
import 'package:vegisite/features/home/vegi_app_home_screen.dart';
import 'package:vegisite/features/sell_on_vegi/sell_vegi_screen.dart';
import 'package:vegisite/state_managers/app_state_manager.dart';
import 'package:vegisite/utils/colors_palette.dart' hide Colors;
import 'package:vegisite/utils/fire_auth.dart';
import 'package:vegisite/widgets/error_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  const env = 'prod';
  final envFile = env == 'prod' ? '.env' : '.env_$env';
  await dotenv.load(fileName: 'environment/$envFile');
  await configureDependencies(environment: isProd ? Env.prod : Env.dev);
  await FireAuth.initializeFirebaseApp();
  final state = LoginState(await SharedPreferences.getInstance());
  await state.checkLoggedIn();
  runApp(App(loginState: state));
}

class App extends StatelessWidget {
  App({Key? key, required this.loginState}) : super(key: key);

  final LoginState loginState;

  final _appStateManager = AppStateManager(
    smallVegiKey: GlobalKey(debugLabel: 'SmallChild-Vegi-TitleText'),
    largeVegiKey: GlobalKey(debugLabel: 'LargeChild-Vegi-TitleText'),
  );
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
          create: (context) => _appStateManager,
        ),
        ChangeNotifierProvider<LoginState>(
          lazy: false,
          create: (BuildContext createContext) => loginState,
        ),
        Provider<MyRouter>(
          lazy: false,
          create: (BuildContext createContext) =>
              MyRouter(loginState, _appStateManager),
        ),
      ],
      child: Builder(builder: (context) {
        final router = Provider.of<MyRouter>(context, listen: false).router;
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

class LoginState extends ChangeNotifier {
  final SharedPreferences prefs;
  bool _loggedIn = false;

  LoginState(this.prefs) {
    loggedIn = prefs.getBool(loggedInKey) ?? false;
  }

  bool get loggedIn => _loggedIn;
  set loggedIn(bool value) {
    _loggedIn = value;
    prefs.setBool(loggedInKey, value);
    notifyListeners();
  }

  Future<void> checkLoggedIn() async {
    loggedIn = prefs.getBool(loggedInKey) ?? await _fireAuthLogIn();
  }

  Future<bool> _fireAuthLogIn() async {
    final firebaseUser = await FireAuth.firebaseSignIn();
    return firebaseUser != null;
  }
}

class MyRouter {
  final LoginState loginState;
  final AppStateManager appStateManager;
  MyRouter(this.loginState, this.appStateManager);

  late final router = GoRouter(
    refreshListenable: loginState,
    debugLogDiagnostics:
        const bool.fromEnvironment('dart.vm.product') ? false : true,
    routes: <GoRoute>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return VegiPage(
              appLoading: this.appStateManager.appLoading, child: HomeScreen());
        },
      ),
      GoRoute(
        path: '/sell-on-vegi',
        builder: (BuildContext context, GoRouterState state) {
          return VegiPage(
              appLoading: this.appStateManager.appLoading,
              child: SellVegiScreen());
        },
      ),
      GoRoute(
        path: '/get-vegi',
        builder: (BuildContext context, GoRouterState state) {
          return VegiPage(
              appLoading: this.appStateManager.appLoading,
              child: GetVegiScreen());
        },
      ),
      GoRoute(
        path: '/$download_vegi_appstore_path',
        name: download_vegi_appstore_path,
        builder: (context, state) => VegiPage(
            appLoading: this.appStateManager.appLoading,
            child: DownloadVegiRedirectUrl(storeType: StoreType.AppStore)),
      ),
      GoRoute(
        path: '/$download_vegi_playstore_path',
        name: download_vegi_playstore_path,
        builder: (context, state) => VegiPage(
            appLoading: this.appStateManager.appLoading,
            child:
                DownloadVegiRedirectUrl(storeType: StoreType.GooglePlayStore)),
      ),
    ],
    errorBuilder: (context, state) => ErrorScreen(state.error),
    redirect: (context, state) {
      //TODO LATER: Implement Login SubDir in site
      // final loginLoc = state.namedLocation(loginRouteName);
      // // // 2
      // // final loggingIn = state.subloc == loginLoc;
      // // // 3
      // // final createAccountLoc = state.namedLocation(createAccountRouteName);
      // // final creatingAccount = state.subloc == createAccountLoc;

      // final loggedIn = loginState.loggedIn;
      // final rootLoc = state.namedLocation(rootRouteName);

      // // // 5
      // // if (!loggedIn && !loggingIn && !creatingAccount) return loginLoc;
      // // if (loggedIn && (loggingIn || creatingAccount)) return rootLoc;
      // if (!loggedIn) return loginLoc;
      // if (loggedIn) return rootLoc;
      // return null;
    },
  );
}
