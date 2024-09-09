import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:kaui_cs/common/router/app_routes.dart';
import 'package:kaui_cs/features/introduction/view/landing_page.dart';
import 'package:kaui_cs/features/introduction/view/welcome_page.dart';

abstract class AppRouter {
  static GoRouter router() {
    final rootNavigatorKey = GlobalKey<NavigatorState>();
    final shellNavigatorKey = GlobalKey<NavigatorState>();

    return GoRouter(
      navigatorKey: rootNavigatorKey,
      routes: [
        GoRoute(
          path: '/',
          name: AppRoutes.landingPage,
          parentNavigatorKey: rootNavigatorKey,
          pageBuilder: (context, state) => pageTransition(
            page: const LandingPage(),
          ),
        ),
        GoRoute(
          path: '/welcome',
          name: AppRoutes.welcomePage,
          pageBuilder: (context, state) => pageTransition(
            page: WelcomePage(),
          ),
        ),
      ],
    );
  }
}

CustomTransitionPage<void> pageTransition({
  required Widget page,
}) {
  return CustomTransitionPage<void>(
    child: page,
    transitionDuration: const Duration(milliseconds: 600),
    transitionsBuilder: (
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child,
    ) {
      return SlideTransition(
        position: animation.drive(
          Tween<Offset>(
            begin: const Offset(1, 0),
            end: Offset.zero,
          ).chain(CurveTween(curve: Curves.easeIn)),
        ),
        child: child,
      );
    },
  );
}
