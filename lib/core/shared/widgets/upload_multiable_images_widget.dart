import 'dart:io';
import 'package:bulka/core/assets/asset_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:bulka/core/utils/constant/app_colors.dart';
import 'package:bulka/core/theme/text_styles/text_styles.dart';
import 'package:bulka/core/utils/constant/app_strings.dart';
import 'package:easy_localization/easy_localization.dart';

class UploadMultiableImagesWidget extends StatefulWidget {
  const UploadMultiableImagesWidget({
    super.key,
    required this.onSelected,
    this.height = 125,
    this.width = 115,
    this.maxLength = 16,
  });
  final Function(List<File> onSelected) onSelected;
  final double height;
  final double width;
  final int maxLength;

  @override
  State<UploadMultiableImagesWidget> createState() =>
      _UploadMultiableImagesWidgetState();
}

class _UploadMultiableImagesWidgetState
    extends State<UploadMultiableImagesWidget> {
  final List<File> _selectedImages = [];

  Future<void> _pickImage() async {
    if (_selectedImages.length >= widget.maxLength) {
      // Prevent adding more than 16 images
      return;
    }

    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _selectedImages.add(File(pickedFile.path));
      });
      widget.onSelected(_selectedImages);
    }
  }

  void _removeImage(int index) {
    setState(() {
      _selectedImages.removeAt(index);
    });
    widget.onSelected(_selectedImages);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ListView.separated(
              separatorBuilder: (context, index) => const SizedBox(width: 15),
              scrollDirection: Axis.horizontal,
              itemCount:
                  _selectedImages.length + 1, // Extra for the "add" button
              itemBuilder: (context, index) {
                if (index == _selectedImages.length) {
                  return GestureDetector(
                    onTap: _pickImage,
                    child: Container(
                      width: widget.width,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.r),
                        color: const Color(0xFFF5F5F5),
                      ),
                      child: SvgPicture.asset(
                        AssetIcons.uploadSvg,
                        // ignore: deprecated_member_use
                        color: const Color(0xFF9E9E9E),
                      ),
                    ),
                  );
                }
                return Stack(
                  children: [
                    Container(
                      width: widget.width,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.r),
                        color: const Color(0xFFF5F5F5),
                      ),
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: Image.file(
                        _selectedImages[index],
                        fit: BoxFit.cover,
                        height: MediaQuery.sizeOf(context).height,
                      ),
                    ),
                    Positioned(
                      right: 0,
                      top: 0,
                      child: InkWell(
                        onTap: () {
                          _removeImage(index);
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
                    )
                  ],
                );
              },
            ),
          ),
          const SizedBox(height: 10),
          Text(
            '${AppStrings.images.tr()} (${_selectedImages.length}/16)',
            style: TextStyles.rubik14W400DarkGrey2
                .copyWith(fontSize: 10.sp, color: const Color(0xFF9E9E9E)),
          ),
        ],
      ),
    );
  }
}
