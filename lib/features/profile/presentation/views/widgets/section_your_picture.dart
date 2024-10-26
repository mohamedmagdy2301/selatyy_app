import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:selaty/core/utils/colors.dart';
import 'package:selaty/core/utils/resposive.dart';
import 'package:selaty/core/utils/text_styles.dart';
import 'package:selaty/features/profile/presentation/view%20model/view_user_profile_cubit/view_user_profile_cubit.dart';

class SectionYourPicture extends StatelessWidget {
  const SectionYourPicture({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ViewUserProfileCubit, ViewUserProfileState>(
      builder: (context, state) {
        return Stack(
          alignment: Alignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Container(
                      height: .16 * context.width,
                      color: Color.fromARGB(255, 238, 238, 238),
                    ),
                    Container(
                      width: context.width * 0.84,
                      height: .18 * context.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                        ),
                        color: primaryGreen,
                      ),
                    ),
                  ],
                ),
                Container(
                  width: context.width * 0.84,
                  padding: EdgeInsets.zero,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                    color: primaryGreen,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        state is ViewUserProfileDone
                            ? state.userProfileInfo.name!
                            : "",
                        style:
                            StylesManager.textStyle_30_bold(context).copyWith(
                          color: primaryWhite,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: context.height * 0.008),
                      Text(
                        state is ViewUserProfileDone
                            ? state.userProfileInfo.email!
                            : "",
                        style:
                            StylesManager.textStyle_11_Light(context).copyWith(
                          color: primaryWhite,
                        ),
                      ),
                      SizedBox(height: context.height * 0.018),
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              top: 0,
              child: Container(
                width: .31 * context.width,
                height: .31 * context.width,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color.fromARGB(255, 238, 238, 238),
                ),

                // https://ui-avatars.com/api/?name=M+M&color=7F9CF5&background=EBF4FF
                child: ClipOval(
                  child: CachedNetworkImage(
                    imageUrl:
                        "https://i.pinimg.com/564x/cd/4b/d9/cd4bd9b0ea2807611ba3a67c331bff0b.jpg",
                    placeholder: (context, url) => Center(
                      child: CircularProgressIndicator(),
                    ),
                    errorWidget: (context, url, error) {
                      return Image.asset(
                        'assets/images/profile.png',
                        width: .28 * context.width,
                        height: .28 * context.width,
                        fit: BoxFit.cover,
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
