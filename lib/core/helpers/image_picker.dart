import 'dart:io';

import 'package:image_picker/image_picker.dart';

class ImagePickerHelper {
  static final ImagePicker picker = ImagePicker();
  static Future<File?> pickImage() async {
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image == null) return null;
    return File(image.path);
  }

  static Future<File?> captureImage() async {
    final XFile? image = await picker.pickImage(source: ImageSource.camera);
    if (image == null) return null;
    return File(image.path);
  }
}
