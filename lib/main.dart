import 'package:concetto_app/screens/home.dart';
import 'package:concetto_app/screens/splash_screen.dart';
import 'package:concetto_app/widgets/rive_animation.dart';
import 'package:concetto_app/services/configs/size_config.dart';
import 'package:concetto_app/services/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return LayoutBuilder(builder: (context, constraints) {
      return OrientationBuilder(builder: (context, orientation) {
        SizeConfig.instance.initialize(constraints, orientation);
        return MaterialApp(
          title: 'Concetto App',
          navigatorKey: navigatorKey,
          theme: AppTheme().themeData(),
          home: const SplashScreen(),
        );
      });
    });
  }
}
