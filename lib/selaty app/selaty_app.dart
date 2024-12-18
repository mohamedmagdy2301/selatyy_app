import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:selaty/core/routers/routers_manager.dart';
import 'package:selaty/features/auth/presentation/view_model/update_user_profile_cubit/update_user_profile_cubit.dart';
import 'package:selaty/features/cart/data/repos/cart_repo_impl.dart';
import 'package:selaty/features/cart/presentation/view%20model/cart_cubit.dart';
import 'package:selaty/features/home/presentation/view%20model/categories_cubit/categories_cubit.dart';
import 'package:selaty/features/home/presentation/view%20model/favorite_product_cubit/favorite_product_cubit.dart';
import 'package:selaty/features/home/presentation/view%20model/products_cubit/products_cubit.dart';
import 'package:selaty/features/home/presentation/view%20model/slider_cubit/slider_cubit.dart';

class SelatyApp extends StatelessWidget {
  const SelatyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SliderCubit>(
      create: (context) => SliderCubit()..getSlider(),
      child: BlocProvider(
        create: (context) => CategoriesCubit()..getCategories(),
        child: BlocProvider(
          create: (context) => ProductsCubit()..getProducts(1),
          child: BlocProvider(
            create: (context) => FavoriteProductCubit(),
            child: BlocProvider<UpdateUserProfileCubit>(
              create: (context) => UpdateUserProfileCubit(),
              child: BlocProvider(
                create: (context) => CartCubit(CartRepoImpl())..refreshCart(),
                child: MaterialApp.router(
                  routerConfig: RoutersManager.router,
                  debugShowCheckedModeBanner: false,
                  theme: ThemeData(
                    fontFamily: 'Cairo',
                    scaffoldBackgroundColor: Colors.white,
                    appBarTheme: const AppBarTheme(
                      backgroundColor: Colors.white,
                    ),
                  ),
                  localizationsDelegates: const [
                    GlobalCupertinoLocalizations.delegate,
                    GlobalMaterialLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                  ],
                  supportedLocales: const [
                    Locale("ar", "AE"),
                  ],
                  locale: const Locale("ar", "AE"),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
