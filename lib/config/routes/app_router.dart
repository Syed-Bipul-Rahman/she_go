import 'package:get/get.dart';
import 'package:shego/features/authentication/presentation/views/login_view.dart';
import '../../features/authentication/presentation/views/forgot.screen.dart';
import '../../features/authentication/presentation/views/register.screen.dart';
import '../../features/authentication/presentation/views/reset_password.dart';
import '../../features/authentication/presentation/views/verify_email.dart';
import '../../features/home/presentation/pages/home_page.dart';
import '../../features/home/presentation/pages/logo_animation_page.dart';
import '../../features/home/presentation/views/join_as.screen.dart';
import '../../features/home/presentation/views/onboarding.screen.dart';
import 'route_names.dart';

class AppRouter {
  static final routes = [
    GetPage(name: RouteNames.home, page: () => const HomePage()),
    GetPage(name: RouteNames.splash, page: () => const LogoAnimationScreen()),
    GetPage(name: RouteNames.onboarding, page: () => const OnboardingPage()),
    GetPage(name: RouteNames.joinAs, page: () => const JoinAs()),
    GetPage(name: RouteNames.login, page: () => const LoginView()),
    GetPage(name: RouteNames.register, page: () => const RegisterView()),
    GetPage(name: RouteNames.forgot, page: () => const ForgotView()),
    GetPage(name: RouteNames.verifyEmail, page: () => const VerifyEmail()),
    GetPage(name: RouteNames.resetPassword, page: () => const ResetPassword()),
  ];
}
