import 'package:flutter/material.dart';
import 'package:kaui_cs/common/router/app_router.dart';
import 'package:kaui_cs/counter/counter.dart';
import 'package:kaui_cs/features/introduction/view/landing_page.dart';
import 'package:kaui_cs/l10n/arb/app_localizations.dart';
import 'package:kaui_cs/l10n/l10n.dart';
import 'package:sizer/sizer.dart';

final router = AppRouter.router();

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp.router(
          theme: ThemeData(
            fontFamily: 'Poppins',
            scaffoldBackgroundColor: Colors.white,
            appBarTheme: AppBarTheme(
              backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            ),
            useMaterial3: true,
          ),
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          routerConfig: router,
          builder: (context, child) {
            return Scaffold(
              body: child,
            );
          },
        );
      },
    );
  }
}
