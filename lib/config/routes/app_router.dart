import 'package:get/get.dart';
import '../../features/home/presentation/pages/home_page.dart';
import '../../features/home/presentation/pages/logo_animation_page.dart';
import '../../features/home/presentation/views/onboarding.screen.dart';
import 'route_names.dart';

class AppRouter {
  static final routes = [
    GetPage(name: RouteNames.home, page: () => const HomePage()),
    GetPage(name: RouteNames.splash, page: () => const LogoAnimationScreen()),
    GetPage(name: RouteNames.onboarding, page: () => const OnboardingPage()),
  ];
}
