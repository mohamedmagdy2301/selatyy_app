import 'package:go_router/go_router.dart';
import 'package:selaty/features/auth/presentation/views/screens/auth_screen.dart';
import 'package:selaty/features/auth/presentation/views/screens/change_password_screen.dart';
import 'package:selaty/features/auth/presentation/views/screens/login_screen.dart';
import 'package:selaty/features/auth/presentation/views/screens/otp_screen.dart';
import 'package:selaty/features/auth/presentation/views/screens/register_screen.dart';
import 'package:selaty/features/home/presentation/views/screens/home_screen.dart';
import 'package:selaty/features/onboarding/preseentation/view/screens/onboarding_screen.dart';
import 'package:selaty/features/onboarding/preseentation/view/screens/splash_screen.dart';
import 'package:selaty/main_scaffold.dart';

class RoutersManager {
  static const String kSplashScreen = '/';
  static const String kOnboardingScreen = "/onboardingView";
  static const String kAuthScreen = "/authView";
  static const String kLoginScreen = "/loginView";
  static const String kRegisterScreen = "/registerView";
  static const String kOtpScreen = "/otpView";
  static const String kChangePasswordScreen = "/changePasswordView";
  static const String kCartScreen = "/cartView";
  static const String kEmptyCartScreen = "/emptyCartView";
  static const String kAddressDeliveryScreen = "/addressDeliveryView";
  static const String kSuccessOrderDeliveryScreen = "/successOrderDeliveryView";
  static const String kTimelineTileScreen = "/timelineTileView";
  static const String kMainScaffoldScreen = "/mainScaffoldView";

  static final router = GoRouter(
    initialLocation: kSplashScreen,
    routes: [
      ShellRoute(
        builder: (context, state, child) {
          return MainScaffold(child: child);
        },
        routes: [
          GoRoute(
            path: kMainScaffoldScreen,
            builder: (context, state) => HomeScreen(),
          ),
        ],
      ),
      GoRoute(
        path: kSplashScreen,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: kOnboardingScreen,
        builder: (context, state) => const OnboardingScreen(),
      ),
      GoRoute(
        path: kAuthScreen,
        builder: (context, state) => const AuthScreen(),
      ),
      GoRoute(
        path: kLoginScreen,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: kRegisterScreen,
        builder: (context, state) => const RegisterScreen(),
      ),
      GoRoute(
        path: kOtpScreen,
        builder: (context, state) => const OtpVerificationScreen(),
      ),
      GoRoute(
        path: kChangePasswordScreen,
        builder: (context, state) => const ChangePasswordScreen(),
      ),
    ],
  );
}
