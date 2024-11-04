import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:selaty/core/constants/constants.dart';
import 'package:selaty/core/local_storage/shared_preferences_manager.dart';
import 'package:selaty/core/utils/colors.dart';
import 'package:selaty/core/utils/resposive.dart';
import 'package:selaty/core/utils/text_styles.dart';
import 'package:selaty/features/home/presentation/view%20model/products_cubit/products_cubit.dart';
import 'package:selaty/features/home/presentation/views/widgets/build/build_all_products.dart';

class AllProductsScreen extends StatefulWidget {
  const AllProductsScreen({super.key});

  @override
  State<AllProductsScreen> createState() => _AllProductsScreenState();
}

class _AllProductsScreenState extends State<AllProductsScreen> {
  int nextPage = 2;
  bool isLoading = false;

  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _loadNextPage();
    _scrollController.addListener(_scrollListener);
  }

  Future<void> _loadNextPage() async {
    setState(() {
      nextPage = SharedPreferencesManager.getData(key: nextPageKey) ?? 2;
    });
  }

  Future<void> _saveNextPage() async {
    await SharedPreferencesManager.setData(key: nextPageKey, value: nextPage);
  }

  void _scrollListener() {
    var currentPosition = _scrollController.position.pixels;
    var maxScrollExtent = _scrollController.position.maxScrollExtent;

    if (currentPosition >= 0.9 * maxScrollExtent && !isLoading) {
      setState(() {
        isLoading = true;
      });
      if (nextPage <= 6) {
        context.read<ProductsCubit>().getProducts(nextPage++).then((_) {
          _saveNextPage();
          setState(() {
            isLoading = false;
          });
        });
      }
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundScaffold,
      body: SafeArea(
        bottom: false,
        child: _buildLandscapeBody(),
      ),
    );
  }

  Widget _buildLandscapeBody() {
    return NestedScrollView(
      controller: _scrollController,
      physics: const BouncingScrollPhysics(),
      headerSliverBuilder: (context, innerBoxIsScrolled) {
        return [
          SliverAppBar(
            pinned: !context.isLandscape,
            floating: context.isLandscape,
            snap: context.isLandscape,
            toolbarHeight: context.height * 0.07,
            title: Text(
              "كل المنتجات",
              style: StylesManager.textStyle_28_bold(context).copyWith(
                color: primaryBlack,
              ),
            ),
            centerTitle: true,
            flexibleSpace: Container(color: backGroundScaffold),
          ),
        ];
      },
      body: const BuildAllProductsHome(),
    );
  }
}
