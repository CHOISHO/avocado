import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:avocado/config/text_theme.dart';
import 'package:avocado/feature/view/splash/splash_view.dart';
import 'package:avocado/firebase_options.dart';
import 'package:avocado/routes.dart';
import 'package:avocado/util/push_notification.dart';
import 'package:avocado/util/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: '.env');

  await SharedPreferencesUtil().init();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  WidgetsBinding.instance.addPostFrameCallback((_) async {
    await PushNotificationUtil().init();
  });

  if (kDebugMode) {
    FirebaseFunctions.instance.useFunctionsEmulator('localhost', 5001);
  }

  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Pretendard',
        textTheme: textTheme,
      ),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('ko'),
      ],
      routes: routes,
      home: const SplashView(),
    );
  }
}
