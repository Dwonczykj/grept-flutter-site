import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:vegisite/constants.dart';
import 'package:vegisite/features/get_vegi/download_vegi_appstore.dart';
import 'package:vegisite/features/get_vegi/get_vegi_screen.dart';
import 'package:vegisite/features/home/home_screen.dart';
import 'package:vegisite/features/home/vegi_app_home_screen.dart';
import 'package:vegisite/features/home/vegi_eats_screen.dart';
import 'package:vegisite/features/home/vegi_pay_screen.dart';
import 'package:vegisite/features/sell_on_vegi/sell_vegi_screen.dart';
import 'package:vegisite/state_managers/app_state_manager.dart';
import 'package:vegisite/widgets/error_screen.dart';

class VegiRouter {
  final AppStateManager appStateManager;
  VegiRouter(this.appStateManager);

  late final router = GoRouter(
    refreshListenable: appStateManager,
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
        path: '/$vegiEatRoute',
        name: vegiEatRoute,
        builder: (BuildContext context, GoRouterState state) {
          return VegiPage(
              appLoading: this.appStateManager.appLoading,
              child: VegiEatsScreen());
        },
      ),
      GoRoute(
        path: '/$vegiPayRoute',
        name: vegiPayRoute,
        builder: (BuildContext context, GoRouterState state) {
          return VegiPage(
              appLoading: this.appStateManager.appLoading,
              child: VegiPayScreen()); //todo VegiPay Screen
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
      GoRoute(
        path: '/$finishSignUp',
        name: finishSignUp,
        builder: (context, state) => VegiPage(
            appLoading: this.appStateManager.appLoading, child: HomeScreen()),
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
