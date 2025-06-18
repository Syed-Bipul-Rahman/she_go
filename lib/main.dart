import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'config/di/injector.dart';
import 'config/routes/app_router.dart';
import 'config/routes/route_names.dart';
import 'core/utils/logger.dart';
import 'shared/theme/app_themes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Required for async initialization
  AppLogger.setup();
  await Injector.init(); // Ensure injector completes before app starts
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'My App',
      theme: AppThemes.lightTheme,
      initialRoute: RouteNames.home,
      getPages: AppRouter.routes,
    );
  }
}
