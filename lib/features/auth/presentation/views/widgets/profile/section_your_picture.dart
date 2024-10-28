import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:selaty/core/constants/constants.dart';
import 'package:selaty/core/utils/colors.dart';
import 'package:selaty/core/utils/resposive.dart';
import 'package:selaty/core/utils/text_styles.dart';
import 'package:selaty/features/auth/presentation/view_model/view_user_profile_cubit/view_user_profile_cubit.dart';
import 'package:skeletonizer/skeletonizer.dart';

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
                            StylesManager.textStyle_40_Red_AR(context).copyWith(
                          color: primaryWhite,
                          fontWeight: FontWeight.w800,
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
                child: ClipOval(
                  child: CachedNetworkImage(
                    fit: BoxFit.cover,
                    width: .28 * context.width,
                    height: .28 * context.width,
                    imageUrl: state is ViewUserProfileDone
                        ? state.userProfileInfo.profilePhotoUrl!
                        : "",
                    placeholder: (context, url) {
                      Future.delayed(Duration(seconds: 6));
                      return Skeletonizer(
                        effect: ShimmerEffect(
                          baseColor: Colors.grey.shade400,
                          highlightColor: Colors.grey.shade200,
                          duration: Duration(seconds: 1),
                        ),
                        enabled: true,
                        child: Image.asset(
                          kAvatarImageUrl,
                        ),
                      );
                    },
                    errorWidget: (context, url, error) {
                      return Image.asset(
                        kAvatarImageUrl,
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
