import 'package:bulka/core/utils/constant/app_colors.dart';
import 'package:bulka/core/utils/constant/app_env.dart';
import 'package:bulka/core/utils/constant/app_strings.dart';
import 'package:bulka/core/utils/widgets/misc/customer_scroll_behaviour.dart';
import 'package:bulka/core/utils/widgets/responsive/responsive.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({super.key});
  final double mainSpace = 25;
  final double smallSpace = 5;
  final appEmail = 'bulka@gmail.com';

  @override
  Widget build(BuildContext context) {
    TextStyle titleStyle = const TextStyle(
      color: AppColors.black,
      fontWeight: FontWeight.bold,
      fontSize: 15,
    );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        centerTitle: true,
        title: const CustomeHeadlineText(
          AppStrings.privacyPolice,
          color: AppColors.white,
          style: TextStyle(
            color: AppColors.white,
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: AppColors.white,
          ),
        ),
      ),
      body: ScrollConfiguration(
        behavior: MyCustomScrollBehavior(),
        child: SingleChildScrollView(
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  AppColors.white,
                  AppColors.white,
                ],
                begin: AlignmentDirectional.topCenter,
                end: AlignmentDirectional.bottomCenter,
              ),
            ),
            child: Padding(
              padding: Responsive.isLarge(context)
                  ? const EdgeInsets.all(40.0)
                  : Responsive.isMedium(context)
                      ? const EdgeInsets.all(20.0)
                      : const EdgeInsets.all(12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomeHeadlineText(
                    'Privacy Policy of ${AppEnv.projectName}',
                    color: Colors.black,
                    style: titleStyle,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  SizedBox(height: smallSpace),
                  const CustomeSmallText(
                    "If you choose to use our Service, then you agree to the collection and use of information in relation with this policy. The Personal Information that we collect are used for providing and improving the Service. We will not use or share your information with anyone except as described in this Privacy Policy.",
                    color: AppColors.grey,
                    maxLines: 10,
                    fontSize: 15,
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(height: mainSpace),
                  CustomeHeadlineText(
                    "Information Collection and Use",
                    color: Colors.black,
                    style: titleStyle,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    maxLines: 10,
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(height: smallSpace),
                  const CustomeSmallText(
                    "For a better experience while using our Service, we may require you to provide us with certain personally identifiable information, including but not limited to your name, phone number, and postal address. The information that we collect will be used to contact or identify you.",
                    color: AppColors.grey,
                    maxLines: 10,
                    fontSize: 15,
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(height: mainSpace),
                  CustomeHeadlineText(
                    "Log Data",
                    color: Colors.black,
                    style: titleStyle,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    maxLines: 10,
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(
                    height: smallSpace,
                  ),
                  const CustomeSmallText(
                    "We want to inform you that whenever you visit our Service, we collect information that your browser sstarts to us that is called Log Data. This Log Data may include information such as your computer’s Internet Protocol (IP) address, browser version, pages of our Service that you visit, the time and date of your visit, the time spent on those pages, and other statistics.",
                    color: AppColors.grey,
                    maxLines: 10,
                    fontSize: 15,
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(
                    height: mainSpace,
                  ),
                  CustomeHeadlineText(
                    "Cookies",
                    color: Colors.black,
                    style: titleStyle,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    maxLines: 10,
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(
                    height: smallSpace,
                  ),
                  const CustomeSmallText(
                    "Cookies are files with small amount of data that is commonly used an anonymous unique identifier. These are sent to your browser from the website that you visit and are stored on your computer’s hard drive.",
                    color: AppColors.grey,
                    maxLines: 10,
                    fontSize: 15,
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(
                    height: smallSpace,
                  ),
                  const CustomeSmallText(
                    "Our website uses these cookies to collection information and to improve our Service. You have the option to either accept or refuse these cookies, and know when a cookie is being sent to your computer. If you choose to refuse our cookies, you may not be able to use some portions of our Service.",
                    color: AppColors.grey,
                    maxLines: 10,
                    fontSize: 15,
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(
                    height: smallSpace,
                  ),
                  const CustomeSmallText(
                    "For more general information on cookies, please read Cookies article from the Privacy Policy Generator.",
                    color: AppColors.grey,
                    maxLines: 10,
                    fontSize: 15,
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(
                    height: mainSpace,
                  ),
                  CustomeHeadlineText(
                    "Service Providers",
                    color: Colors.black,
                    style: titleStyle,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    maxLines: 10,
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(
                    height: smallSpace,
                  ),
                  const CustomeSmallText(
                    "We may employ third-party companies and individuals due to the following reasons:",
                    color: AppColors.grey,
                    maxLines: 10,
                    fontSize: 15,
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(
                    height: mainSpace,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const CustomeSmallText(
                        "To facilitate our Service . ",
                        color: AppColors.grey,
                        maxLines: 10,
                        fontSize: 15,
                        textAlign: TextAlign.start,
                      ),
                      if (Responsive.isLarge(context) ||
                          Responsive.isMedium(context))
                        const SizedBox(
                          width: 10,
                        ),
                      CustomeHeadlineText(
                        "*",
                        color: Colors.black,
                        style: titleStyle,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        maxLines: 10,
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const CustomeSmallText(
                        "To provide the Service on our behalf. ",
                        color: AppColors.grey,
                        maxLines: 10,
                        fontSize: 15,
                        textAlign: TextAlign.start,
                      ),
                      if (Responsive.isLarge(context) ||
                          Responsive.isMedium(context))
                        const SizedBox(
                          width: 10,
                        ),
                      CustomeHeadlineText(
                        "*",
                        color: Colors.black,
                        style: titleStyle,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        maxLines: 10,
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const CustomeSmallText(
                        "To perform Service-related services . ",
                        color: AppColors.grey,
                        maxLines: 10,
                        fontSize: 15,
                        textAlign: TextAlign.start,
                      ),
                      if (Responsive.isLarge(context) ||
                          Responsive.isMedium(context))
                        const SizedBox(
                          width: 10,
                        ),
                      CustomeHeadlineText(
                        "*",
                        color: Colors.black,
                        style: titleStyle,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        maxLines: 10,
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const CustomeSmallText(
                        "To assist us in analyzing how our Service is used .",
                        color: AppColors.grey,
                        maxLines: 10,
                        fontSize: 15,
                        textAlign: TextAlign.start,
                      ),
                      if (Responsive.isLarge(context) ||
                          Responsive.isMedium(context))
                        const SizedBox(
                          width: 10,
                        ),
                      CustomeHeadlineText(
                        "*",
                        color: Colors.black,
                        style: titleStyle,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        maxLines: 10,
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                  SizedBox(height: smallSpace),
                  const CustomeSmallText(
                    "We want to inform our Service users that these third parties have access to your Personal Information. The reason is to perform the tasks assigned to them on our behalf. However, they are obligated not to disclose or use the information for any other purpose.",
                    color: AppColors.grey,
                    maxLines: 10,
                    fontSize: 15,
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(height: mainSpace),
                  CustomeHeadlineText(
                    "Security",
                    color: Colors.black,
                    style: titleStyle,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    maxLines: 10,
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(height: smallSpace),
                  const CustomeSmallText(
                    "We value your trust in providing us your Personal Information, thus we are striving to use commercially acceptable means of protecting it. But remember that no method of transmission over the internet, or method of electronic storage is 100% secure and reliable, and we cannot guarantee its absolute security.",
                    color: AppColors.grey,
                    maxLines: 10,
                    fontSize: 15,
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(height: mainSpace),
                  CustomeHeadlineText(
                    "Links to Other Sites",
                    color: Colors.black,
                    style: titleStyle,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    maxLines: 10,
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(height: smallSpace),
                  const CustomeSmallText(
                    "Our Service may contain links to other sites. If you click on a third-party link, you will be directed to that site. Note that these external sites are not operated by us. Therefore, we strongly advise you to review the Privacy Policy of these websites. We have no control over, and assume no responsibility for the content, privacy policies, or practices of any third-party sites or services.",
                    color: AppColors.grey,
                    maxLines: 10,
                    fontSize: 15,
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(height: mainSpace),
                  CustomeHeadlineText(
                    "Children's Privacy",
                    color: Colors.black,
                    style: titleStyle,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    maxLines: 10,
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(height: smallSpace),
                  const CustomeSmallText(
                    "Our Services do not address anyone under the age of 10. We do not knowingly collect personal identifiable information from children under 10. In the case we discover that a child under 10 has provided us with personal information, we immediately delete this from our servers. If you are a parent or guardian and you are aware that your child has provided us with personal information, please contact us so that we will be able to do necessary actions.",
                    color: AppColors.grey,
                    maxLines: 10,
                    fontSize: 15,
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(height: mainSpace),
                  CustomeHeadlineText(
                    "User-generated content (UGC)",
                    color: Colors.black,
                    style: titleStyle,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    maxLines: 10,
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(height: smallSpace),
                  const CustomeSmallText(
                    "include personal information that is protected under data protection and privacy laws. we also collect  personal information such as the  name and phone number a user provides when signing up for an account allowing them to contact with support and chating with them.",
                    color: AppColors.grey,
                    maxLines: 10,
                    fontSize: 15,
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(height: mainSpace),
                  CustomeHeadlineText(
                    "Changes to This Privacy Policy",
                    color: Colors.black,
                    style: titleStyle,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    maxLines: 10,
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(height: smallSpace),
                  const CustomeSmallText(
                    "We may update our Privacy Policy from time to time. Thus, we advise you to review this page periodically for any changes. We will notify you of any changes by posting the new Privacy Policy on this page. These changes are effective immediately, after they are posted on this page.",
                    color: AppColors.grey,
                    maxLines: 10,
                    fontSize: 15,
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(height: mainSpace),
                  CustomeHeadlineText(
                    "Objectionable Content and Behaviors",
                    color: Colors.black,
                    style: titleStyle,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    maxLines: 10,
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(height: smallSpace),
                  const CustomeSmallText(
                    "The content does not contain any drug-related activities, human trafficking or sexual content. It is only educational content with educational lessons under strict supervision. In the event of any violations, they are immediately reported and dealt with firmly.",
                    color: AppColors.grey,
                    maxLines: 10,
                    fontSize: 15,
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(height: mainSpace),
                  CustomeHeadlineText(
                    "Very Important Note",
                    color: Colors.red,
                    style: titleStyle,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    maxLines: 10,
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(height: smallSpace),
                  const CustomeSmallText(
                    "The user has the right at any time to start a request to permanently delete the account and personal data registered with us, and this request takes only 72 working hours",
                    color: AppColors.grey,
                    maxLines: 10,
                    fontSize: 15,
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(
                    height: mainSpace,
                  ),
                  CustomeHeadlineText(
                    "Contact Us",
                    color: Colors.black,
                    style: titleStyle,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    maxLines: 10,
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(height: smallSpace),
                  Wrap(
                    // alignment: WrapAlignment.start,
                    // crossAxisAlignment: WrapCrossAlignment.start,
                    // direction: Axis.horizontal,
                    // runAlignment: WrapAlignment.start,

                    runSpacing: 0,
                    spacing: 1,
                    children: [
                      CustomeSmallText(
                        "If you have any questions or suggestions about our Privacy Policy, do not hesitate to contact us."
                        " Email : $appEmail",
                        color: AppColors.grey,
                        fontSize: 15,
                        maxLines: 10,
                        textAlign: TextAlign.start,
                      ),
                      InkWell(
                        // onTap: () {
                        //   openMailbox(appEmail);
                        // },
                        child: Text(
                          appEmail,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: AppColors.secondary,
                            decoration: TextDecoration.underline,
                            decorationColor: AppColors.secondary,
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: mainSpace),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // void openMailbox(String recipient) async {
  //   final Uri url = Uri.parse('mailto:$recipient');
  //   if (await canLaunchUrl(url)) {
  //     await launchUrl(url);
  //   } else {
  //     throw 'Could not launch $url';
  //   }
  // }
}

class CustomeHeadlineText extends StatelessWidget {
  const CustomeHeadlineText(
    this.text, {
    super.key,
    this.backgroundColor,
    this.color,
    this.decoration,
    this.fontSize,
    this.fontWeight,
    this.foreground,
    this.height,
    this.letterSpacing,
    this.maxFont,
    this.maxLines,
    this.minFont,
    this.overflow,
    this.style,
    this.textAlign,
    this.wordSpacing,
    this.decorationColor,
  });
  final String text;
  final Color? color;
  final FontWeight? fontWeight;
  final double? minFont;
  final double? maxFont;
  final int? maxLines;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final TextDecoration? decoration;
  final double? fontSize;
  final TextStyle? style;
  final double? letterSpacing;
  final double? wordSpacing;
  final Color? backgroundColor;
  final double? height;
  final Paint? foreground;
  final Color? decorationColor;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style ??
          GoogleFonts.rubik(
            color: color ?? AppColors.darkBlue,
            fontWeight: fontWeight ?? FontWeight.w500,
            decoration: decoration,
            fontSize: fontSize,
            wordSpacing: wordSpacing,
            letterSpacing: letterSpacing,
            backgroundColor: backgroundColor,
            height: height,
            foreground: foreground,
            decorationColor: decorationColor,
          ),
      maxLines: maxLines ?? 1000,
      textAlign: textAlign,
      overflow: overflow ?? TextOverflow.ellipsis,
    );
  }
}

class CustomeSmallText extends StatelessWidget {
  const CustomeSmallText(
    this.text, {
    super.key,
    this.color,
    this.decoration,
    this.fontSize,
    this.fontWeight,
    this.maxFont,
    this.maxLines,
    this.minFont,
    this.style,
    this.textAlign,
    this.decorationColor,
  });
  final String text;
  final Color? color;
  final FontWeight? fontWeight;
  final double? minFont;
  final double? maxFont;
  final int? maxLines;
  final TextAlign? textAlign;
  final TextDecoration? decoration;
  final double? fontSize;
  final TextStyle? style;
  final Color? decorationColor;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style ??
          GoogleFonts.montserrat(
            color: color ?? AppColors.secondary,
            fontWeight: fontWeight ?? FontWeight.w400,
            decoration: decoration ?? TextDecoration.none,
            fontSize: fontSize,
            decorationColor: decorationColor,
          ),
      maxLines: maxLines ?? 1000,
      overflow: TextOverflow.ellipsis,
      textAlign: textAlign ?? TextAlign.start,
    );
  }
}
