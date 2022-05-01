import 'dart:async';

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'src/shared/application/providers.dart';
import 'src/shared/presentation/l10n/generated/l10n.dart';
import 'src/shared/presentation/utils/const.dart';
import 'src/shared/presentation/utils/logger_config.dart';
import 'src/shared/presentation/utils/providers_logger.dart';
import 'routes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  LoggerConfig.init(crashlytics: FirebaseCrashlytics.instance);

  final remoteInstance = FirebaseRemoteConfig.instance;
  final updated = await remoteInstance.fetchAndActivate();
  if (updated) {
    messageKey = remoteInstance.getString('tokenFirebase');
  } else {
    messageKey = remoteInstance.getString('tokenFirebase');
  }

  runZonedGuarded(
      () => runApp(
            const ProviderScope(
              observers: [
                ProvidersLogger(),
              ],
              child: MyApp(),
            ),
          ),
      FirebaseCrashlytics.instance.recordError);
}

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);
  static FirebaseAnalyticsObserver observer =
      FirebaseAnalyticsObserver(analytics: FirebaseAnalytics.instance);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Luna Fashion',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      navigatorObservers: [observer],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        S.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      localeResolutionCallback: (locale, supportedLocales) {
        ref.read(localizationController.notifier).localeChanged(locale!);
        return locale;
        // if (locale == null) {
        //   return supportedLocales.first;
        // }

        // for (final supportedLocale in supportedLocales) {
        //   if (supportedLocale.languageCode == locale.languageCode &&
        //       supportedLocale.countryCode == locale.countryCode) {
        //     return supportedLocale;
        //   }
        // }

        // return supportedLocales.first;
      },
      onGenerateRoute: AppRouter.onGenerateRoute,
      initialRoute: splashRoute,
    );
  }
}
