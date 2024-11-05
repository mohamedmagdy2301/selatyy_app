import 'dart:developer';
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:selaty/core/constants/constants.dart';
import 'package:selaty/core/decoration/decoration.dart';
import 'package:selaty/core/helpers/image_picker.dart';
import 'package:selaty/core/utils/colors.dart';
import 'package:selaty/core/utils/resposive.dart';
import 'package:selaty/core/widgets/custom_button.dart';
import 'package:selaty/features/auth/data/models/update_user_model/update_profile_request.dart';
import 'package:selaty/features/auth/domain/entities/user_profile_entity.dart';
import 'package:selaty/features/auth/presentation/view_model/update_user_profile_cubit/update_user_profile_cubit.dart';
import 'package:selaty/features/auth/presentation/view_model/view_user_profile_cubit/view_user_profile_cubit.dart';
import 'package:skeletonizer/skeletonizer.dart';

class EditUserProfileScreen extends StatefulWidget {
  const EditUserProfileScreen({
    super.key,
    required this.userProfileEntity,
  });
  final UserProfileEntity userProfileEntity;

  @override
  State<EditUserProfileScreen> createState() => _EditUserProfileScreenState();
}

class _EditUserProfileScreenState extends State<EditUserProfileScreen> {
  File? imagePick;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ViewUserProfileCubit, ViewUserProfileState>(
      builder: (context, state) {
        final TextEditingController nameController =
            TextEditingController(text: widget.userProfileEntity.name);
        final TextEditingController emailController = TextEditingController(
          text: widget.userProfileEntity.email,
        );
        final TextEditingController phoneController = TextEditingController(
          text: widget.userProfileEntity.mobile,
        );
        final TextEditingController addressController = TextEditingController(
          text: widget.userProfileEntity.address,
        );

        return Scaffold(
          appBar: AppBar(
            title: const Text('تعديل الملف الشخصي'),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: context.width * .09,
                vertical: context.height * .02,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  GestureDetector(
                    onTap: () async {
                      imagePick = await ImagePickerHelper.pickImage();
                      log(imagePick!.path);
                    },
                    child: ImageWidget(
                        image: widget.userProfileEntity.profilePhotoPath),
                  ),
                  buildTextField('الاسم', nameController),
                  buildTextField('رقم الهاتف', phoneController),
                  buildTextField('البريد الإلكتروني', emailController),
                  buildTextField('العنوان', addressController),
                  SizedBox(height: context.height * .02),
                  CustomButton(
                      titleButton: 'تحديث',
                      colorButton: primaryGreen,
                      onTap: () {
                        context
                            .read<UpdateUserProfileCubit>()
                            .updateUserProfile(
                              param: UpdateProfileRequest(
                                mobile: phoneController.text.trim(),
                                name: nameController.text.trim(),
                                email: emailController.text.trim(),
                                address: addressController.text.trim(),
                                profilePhoto: imagePick ??
                                    widget.userProfileEntity.profilePhotoPath,
                              ),
                            );
                        Navigator.of(context).pop();
                      }),
                  SizedBox(height: context.height * .02),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget buildTextField(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 15),
        ),
      ),
    );
  }
}

class ImageWidget extends StatelessWidget {
  const ImageWidget({
    super.key,
    required this.image,
  });
  final String image;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: .31 * context.width,
      height: .31 * context.width,
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Color.fromARGB(255, 238, 238, 238),
      ),
      child: Stack(
        children: [
          ClipOval(
            child: CachedNetworkImage(
              fit: BoxFit.cover,
              width: .28 * context.width,
              height: .28 * context.width,
              imageUrl: "$kBaseUrlForImage$image",
              placeholder: (context, url) {
                Future.delayed(const Duration(seconds: 6));
                return Skeletonizer(
                  effect: shimmerEffect(),
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
          const Positioned(
            bottom: 10,
            right: 10,
            child: Icon(
              Icons.camera_alt_outlined,
              color: primaryGrey,
              size: 25,
            ),
          )
        ],
      ),
    );
  }
}
