import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:selaty/features/auth/presentation/view_model/is_logged_in_cubit/is_logged_in_cubit.dart';
import 'package:selaty/features/auth/presentation/view_model/login_cubit/login_cubit.dart';
import 'package:selaty/features/auth/presentation/view_model/register_cubit/register_cubit_cubit.dart';
import 'package:selaty/features/auth/presentation/view_model/view_user_profile_cubit/view_user_profile_cubit.dart';
import 'package:selaty/features/auth/presentation/views/screens/auth_screen.dart';
import 'package:selaty/features/auth/presentation/views/screens/change_password_screen.dart';
import 'package:selaty/features/auth/presentation/views/screens/login_screen.dart';
import 'package:selaty/features/auth/presentation/views/screens/otp_screen.dart';
import 'package:selaty/features/auth/presentation/views/screens/register_screen.dart';
import 'package:selaty/features/home/presentation/views/screens/home_screen.dart';
import 'package:selaty/features/onboarding/preseentation/view/screens/onboarding_screen.dart';
import 'package:selaty/features/onboarding/preseentation/view/screens/splash_screen.dart';
import 'package:selaty/selaty%20app/main_scaffold.dart';

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
          return BlocProvider(
            create: (context) => ViewUserProfileCubit()..viewUserProfile(),
            child: MainScaffold(child: child),
          );
        },
        routes: [
          GoRoute(
            path: kMainScaffoldScreen,
            builder: (context, state) => const HomeScreen(),
          ),
        ],
      ),
      GoRoute(
        path: kSplashScreen,
        builder: (context, state) => BlocProvider<IsLoggedInCubit>(
          create: (context) => IsLoggedInCubit()..isLoggedIn(),
          child: const SplashScreen(),
        ),
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
        builder: (context, state) => BlocProvider<LoginCubit>(
          create: (context) => LoginCubit(),
          child: const LoginScreen(),
        ),
      ),
      GoRoute(
        path: kRegisterScreen,
        builder: (context, state) => BlocProvider<RegisterCubit>(
          create: (context) => RegisterCubit(),
          child: const RegisterScreen(),
        ),
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
