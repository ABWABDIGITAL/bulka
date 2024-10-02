import 'dart:io';
import 'package:bulka/core/shared/widgets/spacing.dart';
import 'package:bulka/core/theme/text_styles/text_styles.dart';
import 'package:bulka/core/utils/constant/app_colors.dart';
import 'package:bulka/core/utils/constant/app_strings.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageUploadScreen extends StatefulWidget {
  final Function(File? x) onSelected;

  const ImageUploadScreen({super.key, required this.onSelected});

  @override
  State<ImageUploadScreen> createState() => _ImageUploadScreenState();
}

class _ImageUploadScreenState extends State<ImageUploadScreen> {
  File? _selectedImage;

  Future<void> _pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
      });
      widget.onSelected(_selectedImage);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Stack(
          children: [
            _selectedImage == null
                ? Container(
                    padding: _selectedImage != null
                        ? const EdgeInsets.all(0)
                        : const EdgeInsets.all(30),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: const Color(0xFFDCDCDC),
                        width: 1,
                      ),
                    ),
                    child: const Icon(
                      Icons.photo,
                      color: Color(0xFFDCDCDC),
                    ),
                  )
                : CircleAvatar(
                    radius: 45,
                    backgroundImage: Image.file(
                      _selectedImage!,
                      fit: BoxFit.cover,
                      height: 90,
                    ).image,
                  ),
            if (_selectedImage == null)
              Positioned(
                right: 2,
                bottom: 2,
                child: InkWell(
                  onTap: _pickImage,
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.primary,
                    ),
                    child: const Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 12,
                    ),
                  ),
                ),
              ),
            if (_selectedImage != null)
              Positioned(
                right: 2,
                bottom: 2,
                child: InkWell(
                  onTap: () {
                    setState(() {
                      _selectedImage = null;
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.red,
                    ),
                    child: const Icon(
                      Icons.close,
                      color: Colors.white,
                      size: 12,
                    ),
                  ),
                ),
              ),
          ],
        ),
        hSpace(10),
        Text(
          AppStrings.companyLogo.tr(),
          style: TextStyles.rubik14W500Black,
        ),
      ],
    );
  }
}
