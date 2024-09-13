import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:selaty/core/utils/colors.dart';
import 'package:selaty/core/utils/text_styles.dart';

class TimelineTile extends StatelessWidget {
  final String title;
  final String date;
  final bool isCompleted;
  final VoidCallback onTap;
  final bool isLast;
  final bool previousIsCompleted;
  final bool nextIsCompleted;

  TimelineTile({
    required this.title,
    required this.date,
    required this.isCompleted,
    required this.onTap,
    required this.isLast,
    required this.previousIsCompleted,
    required this.nextIsCompleted,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: StylesManager.textStyle_10_bold(context).copyWith(
                color: isCompleted ? Colors.green : Colors.black,
              ),
            ),
            SizedBox(height: 4),
            Text(
              date,
              style: StylesManager.textStyle_8_Medium(context).copyWith(
                color: primaryGrey,
              ),
            ),
            SizedBox(height: 16),
          ],
        ),
        Column(
          children: [
            GestureDetector(
              onTap: onTap,
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isCompleted ? Colors.green : Colors.grey,
                ),
                child: Icon(
                  isCompleted ? Icons.check : Icons.circle,
                  color: Colors.white,
                ),
              ),
            ),
            Container(
              width: 3,
              height: 50,
              color: previousIsCompleted ? Colors.green : Colors.grey,
            ),
            isLast
                ? Icon(
                    CupertinoIcons.home,
                    color: nextIsCompleted ? Colors.green : Colors.grey,
                    size: 50,
                  )
                : Container(
                    width: 3,
                    height: 50,
                    color: nextIsCompleted ? Colors.green : Colors.grey,
                  ),
          ],
        ),
      ],
    );
  }
}
// import 'package:flutter/material.dart';
// import 'package:timeline_tile/timeline_tile.dart';

// class CustomTimelineTile extends StatelessWidget {
//   const CustomTimelineTile(
//       {super.key,
//       required this.isLast,
//       required this.isFirst,
//       required this.isPast});
//   final bool isLast, isFirst, isPast;
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 200,
//       child: TimelineTile(
//         isLast: isLast,
//         isFirst: isFirst,
//         indicatorStyle: IndicatorStyle(
//           width: 70,
//           iconStyle: IconStyle(
//             iconData: isPast ? Icons.check : Icons.close,
//             color: isPast ? Colors.white : Colors.white54,
//           ),
//           color: isPast ? Colors.green : Colors.green.shade100,
//         ),
//         afterLineStyle: LineStyle(
//           color: isPast ? Colors.green : Colors.green.shade100,
//         ),
//         beforeLineStyle: LineStyle(
//           color: isPast ? Colors.green : Colors.green.shade100,
//         ),
//         endChild: Row(children: [
//           Spacer(),
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const Text("Order Completed"),
//               const Text("Today"),
//             ],
//           ),
//         ]),
//       ),
//     );
//   }
// }

