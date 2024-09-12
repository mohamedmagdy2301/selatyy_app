import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:selaty_app/core/utils/colors.dart';
import 'package:selaty_app/core/utils/resposive.dart';
import 'package:selaty_app/core/utils/text_styles.dart';

class ItemProductCartScreen extends StatefulWidget {
  const ItemProductCartScreen({super.key});

  @override
  State<ItemProductCartScreen> createState() => _ItemProductCartScreenState();
}

class _ItemProductCartScreenState extends State<ItemProductCartScreen> {
  List<int> counts = List<int>.filled(8, 1);
  Color colorIConMinus = primaryBlack;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.height * .6,
      child: ListView.builder(
        itemCount: counts.length,
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) {
          return Container(
            height: context.height > 700
                ? context.height * .15
                : context.height * .19,
            padding: EdgeInsets.symmetric(
              horizontal: context.width * .03,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: primaryWhite,
            ),
            margin: EdgeInsets.only(
              right: context.width * .04,
              top: context.height * .015,
              left: context.isLandscape ? 0 : context.width * .04,
            ),
            child: Row(
              children: [
                SizedBox(
                  width: context.width * .18,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      IconButton(
                        padding: EdgeInsets.zero,
                        icon: Icon(
                          CupertinoIcons.add,
                          size: .03 * context.height,
                        ),
                        onPressed: () {
                          setState(() {
                            counts[index]++;
                          });
                        },
                      ),
                      // Padding(
                      //   padding: EdgeInsets.symmetric(
                      //       horizontal: context.width * .02),
                      //   child: Text(
                      //     "4",
                      //     style: StylesManager.textStyle_11_bold(context),
                      //   ),
                      // ),
                      IconButton(
                        padding: EdgeInsets.zero,
                        icon: Icon(
                          CupertinoIcons.minus,
                          size: .03 * context.height,
                        ),
                        color: colorIConMinus,
                        onPressed: () {
                          setState(() {
                            setState(() {
                              if (counts[index] > 1) counts[index]--;
                            });
                          });
                        },
                      ),
                    ],
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: context.height * .01),
                    Text(
                      "${counts[index]} × 23.00 EGP",
                      style: StylesManager.textStyle_10_Light(context)
                          .copyWith(color: primaryGreen),
                    ),
                    Text(
                      "كمثرى امريكي",
                      style: StylesManager.textStyle_11_bold(context)
                          .copyWith(color: primaryBlack),
                    ),
                    Text(
                      "1 كجم",
                      style: StylesManager.textStyle_9_Medium(context)
                          .copyWith(color: primaryDarkGrey),
                    ),
                    SizedBox(height: context.height * .01),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
