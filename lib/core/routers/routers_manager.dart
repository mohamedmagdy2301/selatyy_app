import 'package:go_router/go_router.dart';
import 'package:selaty_app/features/auth/presenation/views/screens/otp_screen.dart';
import 'package:selaty_app/features/auth/presentation/views/screens/auth_screen.dart';
import 'package:selaty_app/features/auth/presentation/views/screens/change_password_screen.dart';
import 'package:selaty_app/features/auth/presentation/views/screens/login_screen.dart';
import 'package:selaty_app/features/auth/presentation/views/screens/register_screen.dart';
import 'package:selaty_app/features/cart/presentation/views/screens/cart_screen.dart';
import 'package:selaty_app/features/cart/presentation/views/screens/empty_cart_screen.dart';
import 'package:selaty_app/features/delivery/presentation/views/screens/address_delivery_screen.dart';
import 'package:selaty_app/features/delivery/presentation/views/screens/success_order_delivery_screen.dart';
import 'package:selaty_app/features/delivery/presentation/views/screens/timeline_tile_screen.dart';
import 'package:selaty_app/features/home/presentation/views/screens/home_screen.dart';
import 'package:selaty_app/features/onboarding/preseentation/view/screens/onboarding_screen.dart';
import 'package:selaty_app/features/onboarding/preseentation/view/screens/splash_screen.dart';

class RoutersManager {
  static const String kSplashScreen = '/';
  static const String kMainScreen = "/mainView";

  static const String kOnboardingScreen = "/onboardingView";
  static const String kHomeScreen = "/homeView";
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

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: kSplashScreen,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: kHomeScreen,
        builder: (context, state) => HomeScreen(),
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
      GoRoute(
        path: kCartScreen,
        builder: (context, state) => const CartScreen(),
      ),
      GoRoute(
        path: kEmptyCartScreen,
        builder: (context, state) => const EmptyCartScreen(),
      ),
      GoRoute(
        path: kAddressDeliveryScreen,
        builder: (context, state) => const AddressDeliveryScreen(),
      ),
      GoRoute(
        path: kSuccessOrderDeliveryScreen,
        builder: (context, state) => const SuccessOrderDeliveryScreen(),
      ),
      GoRoute(
        path: kTimelineTileScreen,
        builder: (context, state) => TimelineTileScreen(),
      ),
    ],
  );
}
