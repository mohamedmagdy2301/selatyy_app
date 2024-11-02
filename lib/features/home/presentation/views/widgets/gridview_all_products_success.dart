import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:selaty/core/constants/constants.dart';
import 'package:selaty/core/local_storage/shared_preferences_manager.dart';
import 'package:selaty/core/utils/resposive.dart';
import 'package:selaty/features/home/domain/entities/product_entity.dart';
import 'package:selaty/features/home/presentation/view%20model/products_cubit/products_cubit.dart';
import 'package:selaty/features/home/presentation/views/widgets/build/build_item_product_home.dart';

class GridViewAllProductsSuccess extends StatefulWidget {
  const GridViewAllProductsSuccess({
    super.key,
    required this.products,
  });

  final Set<ProductEntity> products;

  @override
  State<GridViewAllProductsSuccess> createState() =>
      _GridViewAllProductsSuccessState();
}

class _GridViewAllProductsSuccessState
    extends State<GridViewAllProductsSuccess> {
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
    bool isTablet = context.width > 600;

    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 0.015 * context.height,
        horizontal: 0.03 * context.width,
      ),
      child: GridView.builder(
        controller: _scrollController,
        itemCount: widget.products.length - 1,
        padding: EdgeInsets.zero,
        scrollDirection: Axis.vertical,
        gridDelegate:
            sliverGridDelegateWithFixedCrossAxisCount(context, isTablet),
        itemBuilder: (context, index) {
          return BuildItemProductHome(
            product: widget.products.elementAt(index + 1),
          );
        },
      ),
    );
  }

  SliverGridDelegateWithFixedCrossAxisCount
      sliverGridDelegateWithFixedCrossAxisCount(
          BuildContext context, bool isTablet) {
    int crossAxisCount = context.isLandscape ? (isTablet ? 4 : 3) : 2;

    double childAspectRatio = context.isLandscape
        ? (isTablet ? 4.5 / 6.4 : 4.4 / 4.5)
        : (isTablet ? 4 / 4.7 : 4 / 6.3);

    return SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: crossAxisCount,
      mainAxisSpacing: 0.02 * context.height,
      crossAxisSpacing: 0.03 * context.width,
      childAspectRatio: childAspectRatio,
    );
  }
}
