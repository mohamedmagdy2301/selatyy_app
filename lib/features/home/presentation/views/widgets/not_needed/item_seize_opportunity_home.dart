import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:selaty/core/utils/colors.dart';
import 'package:selaty/core/utils/resposive.dart';
import 'package:selaty/core/utils/text_styles.dart';

class ItemSeizeOpportunityHome extends StatelessWidget {
  const ItemSeizeOpportunityHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: SizedBox(
        width: context.width * 0.18,
        child: Card(
          color: primaryWhite,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 8, top: 5),
                child: Text(
                  "طبق فواكه",
                  style: StylesManager.textStyle_6_Light(context)
                      .copyWith(color: primaryDarkGrey),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 8),
                child: Text(
                  "خصم 10%  بدون فوايد",
                  style: StylesManager.textStyle_6_bold(context)
                      .copyWith(color: primaryDarkGrey),
                ),
              ),
              SizedBox(height: context.height * 0.01),
              Center(
                child: Image.asset(
                  "assets/images/fruits.png",
                  height: context.height * 0.07,
                  width: context.width * 0.15,
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(height: context.height * 0.01),
              Expanded(
                child: Container(
                  width: context.width * 0.18,
                  alignment: Alignment.centerRight,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                    color: Colors.grey[400],
                  ),
                  child: IconButton(
                    onPressed: () {},
                    padding: EdgeInsets.zero,
                    icon: Icon(
                      CupertinoIcons.back,
                      color: primaryWhite,
                      size: context.textScale * 3,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
