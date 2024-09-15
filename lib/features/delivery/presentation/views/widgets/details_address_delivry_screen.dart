import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:selaty/core/enums/device_type_enum.dart';
import 'package:selaty/core/utils/Strings_app.dart';
import 'package:selaty/core/utils/colors.dart';
import 'package:selaty/core/utils/resposive.dart';
import 'package:selaty/core/utils/text_styles.dart';

class DetailsAddressDelivryScreen extends StatefulWidget {
  const DetailsAddressDelivryScreen({
    super.key,
  });

  @override
  State<DetailsAddressDelivryScreen> createState() =>
      _DetailsAddressDelivryScreenState();
}

class _DetailsAddressDelivryScreenState
    extends State<DetailsAddressDelivryScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height:
          context.isLandscape ? context.height * .78 : context.height * .765,
      child: ListView.builder(
        itemCount: 8,
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) {
          return Container(
            height:
                context.height > 750 && context.deviceType == DeviceType.mobile
                    ? context.height * .17
                    : context.height * .2,
            padding: EdgeInsets.symmetric(
              horizontal: context.width * .05,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: primaryWhite,
            ),
            margin: EdgeInsets.only(
              right: context.isLandscape ? 0 : context.width * .04,
              top: context.height * .015,
              left: context.isLandscape ? 0 : context.width * .04,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: context.height * 0.026,
                  width: context.width * 0.09,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(8),
                      bottomLeft: Radius.circular(8),
                    ),
                    color: primaryGreen,
                  ),
                  child: Text(
                    StringsApp.defaultDelivery,
                    style: StylesManager.textStyle_6_Light(context),
                  ),
                ),
                Row(
                  children: [
                    Radio(
                      value: index,
                      groupValue: currentIndex,
                      onChanged: (value) {
                        currentIndex = index;
                        setState(() {});
                      },
                      activeColor: primaryRed,
                    ),
                    Text(
                      StringsApp.home,
                      style: StylesManager.textStyle_9_bold(context),
                    ),
                    Spacer(),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(CupertinoIcons.ellipsis_vertical),
                    ),
                  ],
                ),
                Text(
                  StringsApp.address,
                  style: StylesManager.textStyle_9_bold(context),
                ),
                Text(
                  StringsApp.addressDetails,
                  style: StylesManager.textStyle_8_Medium(context),
                ),
                Spacer(flex: 1),
                Text(
                  "${StringsApp.phone} : 01015415210",
                  style: StylesManager.textStyle_9_bold(context),
                ),
                Spacer(flex: 1),
              ],
            ),
          );
        },
      ),
    );
  }
}
