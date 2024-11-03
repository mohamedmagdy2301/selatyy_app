import 'package:flutter/material.dart';
import 'package:selaty/core/utils/colors.dart';
import 'package:selaty/core/utils/resposive.dart';
import 'package:selaty/core/utils/text_styles.dart';
import 'package:selaty/features/home/presentation/views/widgets/build/build_favorite.dart';

class FavoritesProductsScreen extends StatelessWidget {
  const FavoritesProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundScaffold,
      appBar: _buildAppBar(context, context.isLandscape),
      body: SafeArea(
        bottom: !context.isLandscape,
        child: context.isLandscape ? _buildLandscapeBody() : BuildFavorite(),
      ),
    );
  }

  PreferredSizeWidget? _buildAppBar(BuildContext context, bool isLandscape) {
    return isLandscape
        ? null
        : AppBar(
            toolbarHeight: context.height * 0.07,
            title: Text(
              'سلة المفضلات',
              style: StylesManager.textStyle_28_bold(context).copyWith(
                color: primaryBlack,
              ),
            ),
            centerTitle: true,
            flexibleSpace: Container(color: backGroundScaffold),
          );
  }

  Widget _buildLandscapeBody() {
    return NestedScrollView(
      physics: BouncingScrollPhysics(),
      headerSliverBuilder: (context, innerBoxIsScrolled) {
        return [
          SliverAppBar(
            pinned: false,
            floating: true,
            snap: true,
            toolbarHeight: context.height * 0.07,
            title: Text(
              'سلة المفضلات',
              style: StylesManager.textStyle_28_bold(context).copyWith(
                color: primaryBlack,
              ),
            ),
            centerTitle: true,
            flexibleSpace: Container(color: backGroundScaffold),
          ),
        ];
      },
      body: BuildFavorite(),
    );
  }
}
