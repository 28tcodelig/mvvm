import 'package:complete_advance_flutter/presentation/forgot_password/forgot_password.dart';
import 'package:complete_advance_flutter/presentation/login/login.dart';
import 'package:complete_advance_flutter/presentation/main_view/main_view.dart';
import 'package:complete_advance_flutter/presentation/onboarding/onboarding.dart';
import 'package:complete_advance_flutter/presentation/register/register.dart';
import 'package:complete_advance_flutter/presentation/resources/strings_manager.dart';
import 'package:complete_advance_flutter/presentation/splash/splash.dart';
import 'package:complete_advance_flutter/presentation/store_details/store_detail.dart';
import 'package:flutter/material.dart';

class Routes {
  static const String splashRoutes = "/";
  static const String onBoardingRoutes = "/onBoarding";
  static const String loginRoutes = "/login";
  static const String registerRoutes = "/register";
  static const String forgotPassWordRoutes = "/forgotPassword";
  static const String mainRoutes = "/main";
  static const String storeDetailsRoutes = "/storeDetails";
}

class RountesGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.splashRoutes:
        return MaterialPageRoute(builder: (_) => const SplashView());
      case Routes.onBoardingRoutes:
        return MaterialPageRoute(builder: (_) => const OnBoardingView());
      case Routes.loginRoutes:
        return MaterialPageRoute(builder: (_) => const LoginView());
      case Routes.registerRoutes:
        return MaterialPageRoute(builder: (_) => const RegisterView());
      case Routes.forgotPassWordRoutes:
        return MaterialPageRoute(builder: (_) => const ForgotPasswordView());
      case Routes.mainRoutes:
        return MaterialPageRoute(builder: (_) => const MainView());
      case Routes.storeDetailsRoutes:
        return MaterialPageRoute(builder: (_) => const StoreDetailsView());
      default:
        return unDefineRoute();
    }
  }

  static Route<dynamic> unDefineRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title:  const Text(AppStrings.noRouteFound),
        ),
        body: const Center(
          child: Text(AppStrings.noRouteFound),
        ),
      ),
    );
  }
}
