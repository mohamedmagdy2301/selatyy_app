import 'package:flutter/material.dart';
import 'package:selaty_app/core/utils/Strings_app.dart';
import 'package:selaty_app/core/utils/colors.dart';
import 'package:selaty_app/core/utils/resposive.dart';
import 'package:selaty_app/core/utils/text_styles.dart';
import 'package:selaty_app/features/delivery/presentation/views/widgets/custom_appbar_track_order.dart';
import 'package:selaty_app/features/delivery/presentation/views/widgets/custom_timeline_tile.dart';

class TimelineTileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        actions: CustomAppbarTrackOrder.appBarActions(context),
        backgroundColor: Colors.transparent,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.zero,
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: context.height * 0.14,
                width: context.width * 0.8,
                padding: EdgeInsets.symmetric(
                  vertical: context.height * 0.01,
                  horizontal: context.width * 0.03,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: primaryGreen,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "${StringsApp.orderID} :#3289789 ",
                          style:
                              StylesManager.textStyle_10_bold(context).copyWith(
                            color: primaryWhite,
                          ),
                        ),
                        SizedBox(height: context.height * 0.005),
                        Text(
                          "${StringsApp.orderDate}",
                          style: StylesManager.textStyle_8_Medium(context)
                              .copyWith(
                            color: primaryWhite,
                          ),
                        ),
                        SizedBox(height: context.height * 0.015),
                        Row(
                          children: [
                            Text(
                              "${StringsApp.orderItems}8 ",
                              style: StylesManager.textStyle_8_Medium(context)
                                  .copyWith(
                                color: primaryWhite,
                              ),
                            ),
                            SizedBox(width: context.width * 0.05),
                            Text(
                              "${StringsApp.totalPrice}EGP 880 ",
                              style: StylesManager.textStyle_8_Medium(context)
                                  .copyWith(
                                color: primaryWhite,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    Container(
                      height: context.height * 0.15,
                      width: context.width * .2,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: Icon(
                        Icons.local_shipping_outlined,
                        color: primaryBlack,
                        size: context.height * 0.06,
                      ),
                    ),
                  ],
                ),
              ),
              TimeLineCard(),
            ],
          ),
        ),
      ),
    );
  }
}

class TimeLineCard extends StatefulWidget {
  const TimeLineCard({super.key});

  @override
  State<TimeLineCard> createState() => _TimeLineCardState();
}

class _TimeLineCardState extends State<TimeLineCard> {
  List<bool> isCompleted = [true, false, false];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width * 0.8,
      padding: EdgeInsets.symmetric(
        vertical: context.height * 0.05,
        horizontal: context.width * 0.06,
      ),
      margin: EdgeInsets.symmetric(
        vertical: context.height * 0.02,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TimelineTile(
            title: StringsApp.successOrder,
            date: '7 September 2024',
            isCompleted: isCompleted[0],
            onTap: () {},
            isLast: false,
            previousIsCompleted: isCompleted[0],
            nextIsCompleted: isCompleted[1],
          ),
          TimelineTile(
            title: StringsApp.deliverySuccessOrder,
            date:
                isCompleted[1] ? '19 September 2024' : StringsApp.orderPending,
            isCompleted: isCompleted[1],
            onTap: () {
              setState(() {
                if (isCompleted[0] == true && isCompleted[2] == false) {
                  isCompleted[1] = !isCompleted[1];
                }
              });
            },
            isLast: false,
            previousIsCompleted: isCompleted[1],
            nextIsCompleted: isCompleted[2],
          ),
          TimelineTile(
            title: StringsApp.successDelivery,
            date:
                isCompleted[2] ? '30 September 2024' : StringsApp.orderPending,
            isLast: true,
            isCompleted: isCompleted[2],
            onTap: () {
              setState(() {
                if (isCompleted[1] == true) {
                  isCompleted[2] = !isCompleted[2];
                }
              });
            },
            previousIsCompleted: isCompleted[2],
            nextIsCompleted: isCompleted[2],
          ),
        ],
      ),
    );
  }
}
