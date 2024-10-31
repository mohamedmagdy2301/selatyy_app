import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:selaty/core/constants/constants.dart';
import 'package:selaty/core/decoration/decoration.dart';
import 'package:selaty/core/utils/colors.dart';
import 'package:selaty/core/utils/resposive.dart';
import 'package:selaty/core/utils/text_styles.dart';
import 'package:selaty/features/home/presentation/view%20model/add_favorite_product_cubit/add_favorite_product_cubit.dart';
import 'package:skeletonizer/skeletonizer.dart';

class FavoritsProductsScreen extends StatefulWidget {
  const FavoritsProductsScreen({super.key});

  @override
  State<FavoritsProductsScreen> createState() => _FavoritsProductsScreenState();
}

class _FavoritsProductsScreenState extends State<FavoritsProductsScreen> {
  @override
  void initState() {
    context.read<AddFavoriteProductCubit>().viewFavoriteProduct();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var cubit = context.watch<AddFavoriteProductCubit>();
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 234, 234, 234),
      body: NestedScrollView(
        physics: NeverScrollableScrollPhysics(),
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              // pinned: true,
              floating: true,
              snap: true,
              expandedHeight: context.height * 0.06,
              toolbarHeight: context.height * 0.06,
              title: Text(
                'المفضل',
                style: StylesManager.textStyle_14_bold(context),
              ),
              centerTitle: true,
              automaticallyImplyLeading: false,
            ),
          ];
        },
        body: cubit.favoriteProductsList.isEmpty
            ? Center(
                child: Text('لايوجد مفضلات'),
              )
            :
            //  OrientationBuilder(builder: (context, orientation) {
            //   if (orientation == Orientation.landscape) {
            //     return Padding(
            //       padding: EdgeInsets.symmetric(
            //         vertical: context.height * 0.04,
            //         horizontal: context.width * 0.2,
            //       ),
            //       child: GridView.builder(
            //         itemCount: 0,
            //         padding: EdgeInsets.zero,
            //         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            //           crossAxisCount: 3,
            //           mainAxisSpacing: .04 * context.width,
            //           crossAxisSpacing: .015 * context.width,
            //           childAspectRatio: 4.4 / 5.5,
            //         ),
            //         itemBuilder: (context, index) {
            //           return BlocConsumer<AddFavoriteProductCubit,
            //               AddFavoriteProductState>(
            //             listener: (context, state) {
            //               if (state is AddFavoriteProductError) {
            //                 ScaffoldMessenger.of(context).showSnackBar(
            //                   SnackBar(
            //                     content: Text(state.message),
            //                   ),
            //                 );
            //               }
            //             },
            //             builder: (context, state) {
            //               return ItemAllProductHome(
            //                 product: [],
            //                 isFavorite: true,
            //                 onFavorite: () {
            //                   // context
            //                   //     .read<AddFavoriteProductCubit>()
            //                   //     .addFavoriteProduct(
            //                   //         productId: products[index + 1].id!);
            //                 },
            //               );
            //             },
            //           );
            //         },
            //       ),
            //     );
            //   }
            //   return
            Padding(
                padding: EdgeInsets.symmetric(
                    vertical: context.height * 0.04,
                    horizontal: context.width * 0.06),
                child: GridView.builder(
                  itemCount: cubit.favoriteProductsList.length - 1,
                  padding: EdgeInsets.zero,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: .04 * context.width,
                    crossAxisSpacing: 10,
                    childAspectRatio: 4 / 6.3,
                  ),
                  itemBuilder: (context, index) {
                    return Card(
                      color: primaryWhite,
                      child: Stack(
                        children: [
                          Positioned(
                            top: context.height * 0.01,
                            left: context.width * 0.028,
                            right: context.width * 0.028,
                            height: context.height * 0.23,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Center(
                                  child: CachedNetworkImage(
                                    fit: BoxFit.fill,
                                    width: context.width * 0.4,
                                    height: context.height * 0.115,
                                    imageUrl:
                                        "$kBaseUrlForImage${cubit.favoriteProductsList[index + 1].product!.img!}",
                                    placeholder: (context, url) {
                                      return Skeletonizer(
                                        effect: shimmerEffect(),
                                        enabled: true,
                                        child: Image.asset(
                                          kCatagoryImage,
                                          fit: BoxFit.fill,
                                        ),
                                      );
                                    },
                                    errorWidget: (context, url, error) {
                                      return Center(
                                        child: Text(
                                          "لا يوجد صوره لهذا المنتج",
                                          textAlign: TextAlign.center,
                                          style:
                                              StylesManager.textStyle_11_bold(
                                                      context)
                                                  .copyWith(
                                            color: const Color.fromARGB(
                                                113, 54, 54, 54),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                SizedBox(height: context.height * 0.01),
                                Text(
                                  cubit.favoriteProductsList[index + 1].product!
                                          .name ??
                                      "",
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style:
                                      StylesManager.textStyle_11_bold(context)
                                          .copyWith(
                                    color: primaryBlack,
                                  ),
                                ),
                                SizedBox(height: context.height * .005),
                                Text(
                                  cubit.favoriteProductsList[index + 1].product!
                                          .details ??
                                      "",
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style:
                                      StylesManager.textStyle_8_Medium(context)
                                          .copyWith(
                                    color:
                                        const Color.fromARGB(213, 81, 81, 81),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            left: 0,
                            right: 0,
                            height: context.height * 0.058,
                            child: Card(
                              color: const Color.fromARGB(184, 98, 98, 98),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(10),
                                ),
                              ),
                              margin: EdgeInsets.zero,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(width: context.width * 0.03),
                                  Text(
                                    "${cubit.favoriteProductsList[index + 1].product!.price?.split(".").first ?? ""} جنية",
                                    style:
                                        StylesManager.textStyle_14_bold(context)
                                            .copyWith(
                                      color: primaryWhite,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  Spacer(),
                                  IconButton(
                                    onPressed: () {
                                      context
                                          .read<AddFavoriteProductCubit>()
                                          .addFavoriteProduct(
                                              productId: cubit
                                                  .favoriteProductsList[
                                                      index + 1]
                                                  .product!
                                                  .id!);
                                    },
                                    icon: Icon(CupertinoIcons.delete,
                                        color: primaryWhite),
                                  ),
                                  SizedBox(width: context.width * 0.02),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
                //   );
                // }
              ),
      ),
    );
  }
}
