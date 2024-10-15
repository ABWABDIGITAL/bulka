import 'package:bulka/core/assets/asset_icons.dart';
import 'package:bulka/core/theme/text_styles/text_styles.dart';
import 'package:bulka/core/utils/constant/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomSearchBar extends StatefulWidget {
  final bool isHome;
  final String title;

  final Function(String)? onChanged;
  const CustomSearchBar(
      {super.key, this.isHome = false, this.title = 'home', this.onChanged});

  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  bool isSearch = false;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      margin: const EdgeInsets.only(bottom: 8.0),
      decoration: BoxDecoration(
          borderRadius:
              isSearch ? BorderRadius.circular(10) : BorderRadius.circular(40),
          color: AppColors.opactiyPrimary),
      duration: const Duration(milliseconds: 700),
      width: isSearch
          ? MediaQuery.sizeOf(context).width * .93
          : MediaQuery.sizeOf(context).width * .135,
      child: /*  isSearch
                ?  */
          Row(
        children: [
          IconButton(
            icon: SvgPicture.asset(
              AssetIcons.searchSvg,
              color: AppColors.black,
            ),
            onPressed: () {
              setState(() {
                isSearch = !isSearch;
              });
            },
          ),
          AnimatedCrossFade(
            alignment: AlignmentDirectional.centerStart,
            duration: const Duration(milliseconds: 700),
            firstChild: SizedBox(
              width: MediaQuery.sizeOf(context).width * .7,
              child: TextFormField(
                  cursorColor: AppColors.primary,
                  decoration: InputDecoration(
                    hintText: 'Add a skill...',
                    border: InputBorder.none,
                    hintStyle: TextStyles.rubik14W500DarkGrey,
                  ),
                  style: TextStyles.rubik14W500Black,
                  onChanged: widget.onChanged),
            ),
            secondChild: Container(),
            reverseDuration: const Duration(milliseconds: 700),
            secondCurve: Curves.bounceOut,
            crossFadeState:
                isSearch ? CrossFadeState.showFirst : CrossFadeState.showSecond,
          ),
        ],
      ),
    );
  }
}
