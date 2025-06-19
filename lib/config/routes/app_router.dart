import 'package:get/get.dart';
import '../../features/home/presentation/pages/home_page.dart';
import '../../features/home/presentation/pages/logo_animation.dart';
import 'route_names.dart';

class AppRouter {
  static final routes = [
    GetPage(name: RouteNames.home, page: () => const HomePage()),
    GetPage(name: RouteNames.splash, page: () => const LogoAnimationScreen()),
  ];
}
