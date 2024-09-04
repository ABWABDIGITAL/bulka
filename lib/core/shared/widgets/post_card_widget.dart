import 'package:bulka/core/assets/asset_icons.dart';
import 'package:bulka/core/shared/widgets/spacing.dart';
import 'package:bulka/core/theme/text_styles/text_styles.dart';
import 'package:bulka/core/utils/constant/app_colors.dart';
import 'package:bulka/core/utils/widgets/misc/default_network_image.dart';
import 'package:bulka/core/utils/widgets/text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:reaction_askany/models/emotions.dart';
import 'package:reaction_askany/models/reaction_box_paramenters.dart';
import 'package:reaction_askany/reaction_askany.dart';

class PostCardWidget extends StatefulWidget {
  const PostCardWidget({super.key});

  @override
  State<PostCardWidget> createState() => _PostCardWidgetState();
}

class _PostCardWidgetState extends State<PostCardWidget> {
  Emotions? reaction;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: const CircleAvatar(
            backgroundImage: NetworkImage(
              'https://s3-alpha-sig.figma.com/img/a358/0c7c/1e35c5bdb1fdfbc222c05e4e3db5d318?Expires=1726444800&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=mmrD8xVhT75AxyaglUOe~xCk8FLzA36-GaPX9TkWI9tW-fbe3oBg7fdZqCIb4BaWYpxP7bG24yu12UczFThNisGxGFjiJZ-YziT45tNwV2R9iuPkaBXiBCmuOC1RP1044Pnfyhdzmfck9HQTFuWQ7wpAIHSE8h34lnbqr20VSyo-PzGE3~lMpDOhPsDw~LJaZr9HJfBEUNX8rVPhnOke8yLxhVeEesZtPaXNpdbWYzuEdX-w~HKrfxdm-OCZA5IdjHTwcrScnq~up81CB5J2qPDLJRe9oomfxW-Ayff9Fq6UCLF3dTqyOb1prX6DamDq1UsdzzRmIwwOPtf3dvD0pA__',
            ),
          ),
          title: Text(
            'Mercedes Store',
            style: TextStyles.roboto12W500Black2,
          ),
          subtitle: Text(
            'Just Now',
            style: TextStyles.roboto10W500MediumGrey2,
          ),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                AssetIcons.threeDotsSvg,
                height: 6.h,
                width: 18.w,
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.r),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'Mercedes AMG G63',
                      style: TextStyles.roboto14W600Black2,
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.grey),
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    padding:
                        EdgeInsets.symmetric(vertical: 7.r, horizontal: 12.r),
                    child: Text(
                      '3,000,000 EGP',
                      style: TextStyles.roboto14W600Black2,
                    ),
                  )
                ],
              ),
              vSpace(16),
              CustomeExpandableText(
                "Inside the wagon AMG, we don't know which is morecolor we don't know which is more surprising Excepteur ex cillum non nisi sunt consequat duis consequat sint ullamco. Inside the wagon AMG, we don't know which is morecolor we don't know which is more surprising Excepteur ex cillum non nisi sunt consequat duis consequat sint ullamco.",
                style: TextStyles.roboto12W400IconGrey,
              ),
              vSpace(16),
              const PostCardImageWidget(),
              GestureDetector(
                onTapDown: (details) {
                  ReactionAskany.showReactionBox(
                    context,
                    offset: details.globalPosition,
                  );
                },
                child: ReactionWrapper(
                  boxParamenters: ReactionBoxParamenters(
                    brightness: Brightness.light,
                    iconSize: 26,
                    iconSpacing: 10,
                    paddingHorizontal: 30,
                    radiusBox: 40,
                    quantityPerPage: 6,
                  ),
                  buttonReaction: const Padding(
                    padding: EdgeInsets.only(top: 2.0),
                    child: Icon(
                      Icons.face_outlined,
                      size: 20.0,
                      color: Colors.grey,
                    ),
                  ),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 12.0,
                      horizontal: 20.0,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.greenAccent.shade100,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: const Text(
                      'Message from lambiengcode <3',
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}

class PostCardImageWidget extends StatelessWidget {
  const PostCardImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12.r),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          DefaultNetworkImage(
            'https://s3-alpha-sig.figma.com/img/641e/cf2d/21a295503e6558162eb7df97e7ba0a23?Expires=1726444800&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=Ln4zB1-sIalmUQg8tlyWAFoDSgmfOpATT4tx~FLXFUGjr4fmZ5dUzJrDbu4QWgYWhGAAkRpPooH8G-QZOUKADFX7AH-50NLO~QZN~4axsCI78dBJpC3s~F2jWntVOMoZuCrA~VHIqfOk~Muk0OOYuVoSC7SZ7hTvYQrh2nTnEQ4rxydWk1hXm9M~-KoMTg2bOIiGSR4SGtHAaP2wko9W1oWrjupSo-dRM8RtwS~BbVLhiPyYORcnYUY0voQ3ils9HM2M7MJ2lEWFAkcc4AErXu~jjwjQSNYBm7IIW2MhMKkvmbD~dlRF5svZ-jPnkz2oQOZq1do4w9kuDpADrbzDlw__',
            height: 268.h,
            width: MediaQuery.sizeOf(context).width,
            fit: BoxFit.cover,
          ),
          Positioned(
            bottom: 10.r, // Adjust the position as needed
            child: Container(
              width: MediaQuery.sizeOf(context).width,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(
                        0.7), // Adjust opacity for shadow intensity
                    offset: const Offset(0, 5), // Vertical offset of shadow
                    blurRadius: 8, // Blur radius of shadow
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  varientItem(
                    path: AssetIcons.speedoMeter2Svg,
                    text: '5k-10k',
                  ),
                  varientItem(
                    path: AssetIcons.calenderSvg,
                    text: '2023',
                  ),
                  varientItem(
                    path: AssetIcons.unlockSvg,
                    text: 'Used',
                  ),
                  varientItem(
                    path: AssetIcons.scanSvg,
                    text: 'Fabrika',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget varientItem({
    required final String path,
    required final String text,
  }) {
    return Row(
      children: [
        SvgPicture.asset(
          path,
          height: 18.h,
          width: 18.w,
          color: AppColors.white,
        ),
        hSpace(7),
        Text(
          text,
          style: TextStyles.roboto12W500SoftGrey3,
        )
      ],
    );
  }
}
