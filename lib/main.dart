import 'package:flutterapp/core/Utils/approuter.dart';
import './firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'constant.dart';
import 'core/Utils/theme/color_schemes.g.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Hive.initFlutter();
  await Hive.openBox(settingBox);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: Hive.box(settingBox).listenable(),
        builder: (context, box, _) {
          bool darkMode = box.get(darkModeValue, defaultValue: false);
          return MaterialApp.router(
            routerConfig: Approute.router,
            themeMode: darkMode ? ThemeMode.dark : ThemeMode.light,
            theme: ThemeData(
              colorScheme: lightColorScheme,
              useMaterial3: true,
              //textTheme: textTheme,
            ),
            darkTheme: ThemeData(
              colorScheme: darkColorScheme,
              useMaterial3: true,
              //textTheme: textTheme,
            ),
          );
        });
  }
}
