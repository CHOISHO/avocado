import 'package:flutter/material.dart';

import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:avocado/config/text_theme.dart';
import 'package:avocado/feature/view/home_view.dart';
import 'package:avocado/firebase_options.dart';
import 'package:avocado/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // TODO: ERROR 분기 처리
  // - 실패시 화면
  await dotenv.load(fileName: '.env');
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  FirebaseFunctions.instance.useFunctionsEmulator('localhost', 5001);

  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        fontFamily: 'Pretendard',
        textTheme: textTheme,
      ),
      routes: routes,
      home: const HomeView(),
    );
  }
}
