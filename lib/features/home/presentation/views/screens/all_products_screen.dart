import 'package:flutter/material.dart';
import 'package:selaty/core/utils/colors.dart';
import 'package:selaty/core/utils/resposive.dart';
import 'package:selaty/core/utils/text_styles.dart';
import 'package:selaty/features/home/presentation/views/widgets/build/build_all_products.dart';

class AllProductsScreen extends StatelessWidget {
  const AllProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundScaffold,
      appBar: AppBar(
        toolbarHeight: context.height * .07,
        title: Text(
          "كل المنتجات",
          style: StylesManager.textStyle_28_bold(context).copyWith(
            color: primaryBlack,
          ),
        ),
        flexibleSpace: Container(color: backGroundScaffold),
        centerTitle: true,
      ),
      body: BuildAllProductsHome(),
    );
  }
}
