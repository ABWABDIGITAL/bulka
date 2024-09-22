import 'dart:async';

import 'package:bulka/core/assets/asset_icons.dart';
import 'package:bulka/core/assets/asset_translations.dart';
import 'package:bulka/core/services/servies_locator/service_locator.dart';
import 'package:bulka/core/shared/shimmer/shimmer_container_widget.dart';
import 'package:bulka/core/theme/text_styles/text_styles.dart';
import 'package:bulka/core/utils/constant/app_colors.dart';
import 'package:bulka/core/utils/constant/app_strings.dart';
import 'package:bulka/core/utils/widgets/errors/error_screen.dart';
import 'package:bulka/modules/countries/controllers/cubit/country_cubit.dart';
import 'package:bulka/modules/countries/controllers/cubit/country_state.dart';
import 'package:bulka/modules/countries/data/entity/country_entity.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';

class DefaultPhoneFormField extends StatefulWidget {
  const DefaultPhoneFormField({
    super.key,
    this.borderColor,
    this.borderRadious,
    this.decoration,
    this.enabled,
    this.errorMaxLines,
    this.fillColor,
    this.hintText,
    this.labelText,
    this.onChanged,
    this.onCountryChanged,
    this.prefixIcon,
    this.style,
    this.suffixIcon,
    this.titleStyle,
    this.validator,
    this.titleText,
    this.needTitleText = true,
    this.controller,
    this.onCountryChangedReturnApiCountry,
  });
  final Color? fillColor;
  final Color? borderColor;
  final int? errorMaxLines;
  final bool? enabled;
  final InputDecoration? decoration;
  final TextStyle? titleStyle;
  final TextStyle? style;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? labelText;
  final String? hintText;
  final double? borderRadious;
  final void Function(PhoneNumber phone)? onChanged;
  final void Function(Country country)? onCountryChanged;
  final FutureOr<String?> Function(PhoneNumber?)? validator;
  final void Function(CountryEntity country)? onCountryChangedReturnApiCountry;
  final String? titleText;
  final bool? needTitleText;
  final TextEditingController? controller;

  @override
  State<DefaultPhoneFormField> createState() => _DefaultPhoneFormFieldState();
}

class _DefaultPhoneFormFieldState extends State<DefaultPhoneFormField> {
  final FocusNode focusNode = FocusNode();

  Country? initialCountry;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CountryCubit(sl())..countriesStatesHandled(),
      child: BlocBuilder<CountryCubit, CountryState>(
        buildWhen: (previous, current) =>
            current is GetCountriesError ||
            current is GetCountriesLoading ||
            current is GetCountriesSuccess,
        builder: (context, state) {
          if (state is GetCountriesError) {
            return ErrorScreen(
              error: state.error,
              onPressed: () {
                context.read<CountryCubit>().countriesStatesHandled();
              },
            );
          }
          if (state is GetCountriesLoading) {
            return ShimmerContainerWidget(
              height: 45,
              width: MediaQuery.sizeOf(context).width,
            );
          }
          if (state is GetCountriesSuccess) {
            //THIS FOR FIRST TIME INIT
            if (state.countries.isNotEmpty && initialCountry == null) {
              initialCountry = Country(
                name: state.countries.first.name,
                flag: state.countries.first.countryCodeByDial,
                code: state.countries.first.phoneCode,
                dialCode: state.countries.first.phoneCode,
                nameTranslations: {
                  "en": state.countries.first.name,
                  "ar": state.countries.first.name,
                  "tr": state.countries.first.name
                },
                minLength: int.parse(state.countries.first.phoneLimit),
                maxLength: int.parse(state.countries.first.phoneLimit),
              );
              widget.onCountryChangedReturnApiCountry?.call(
                state.countries.firstWhere(
                  (element) => element.phoneCode == initialCountry!.dialCode,
                ),
              );
            }

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (widget.needTitleText!)
                  Padding(
                    padding: EdgeInsetsDirectional.only(bottom: 12.r),
                    child: Text(
                      widget.titleText ?? AppStrings.phoneNumber.tr(),
                      style:
                          widget.titleStyle ?? TextStyles.rubik13W500HardGrey2,
                    ),
                  ),
                Theme(
                  data: ThemeData(
                    dialogTheme: DialogTheme(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.r),
                      ),
                    ),
                  ),
                  child: IntlPhoneField(
                    focusNode: focusNode,
                    validator: widget.validator,
                    controller: widget.controller,
                    initialCountryCode: initialCountry?.code,
                    showCountryFlag: true,
                    invalidNumberMessage: 'Invalid phone number'.tr(),
                    countries: [
                      ...state.countries.map(
                        (e) => Country(
                          name: e.name,
                          flag: e.countryCodeByDial,
                          code: e.phoneCode,
                          dialCode: e.phoneCode,
                          nameTranslations: {
                            "en": e.name,
                            "ar": e.name,
                            "tr": e.name
                          },
                          minLength: int.parse(e.phoneLimit),
                          maxLength: int.parse(e.phoneLimit),
                        ),
                      )
                    ],
                    pickerDialogStyle: PickerDialogStyle(
                      searchFieldInputDecoration: InputDecoration(
                        hintText: 'Search'.tr(),
                        disabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color:
                                widget.borderColor ?? const Color(0xFFDCDCDC),
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(
                              widget.borderRadious ?? 12.r),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color:
                                widget.borderColor ?? const Color(0xFFDCDCDC),
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(
                              widget.borderRadious ?? 12.r),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color(0xFFFF0000),
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(
                              widget.borderRadious ?? 12.r),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                              widget.borderRadious ?? 12.r),
                          borderSide: BorderSide(
                              color: widget.borderColor ?? AppColors.primary),
                        ),
                        contentPadding: const EdgeInsetsDirectional.fromSTEB(
                            10, 10, 10, 10),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: widget.borderColor ?? AppColors.red,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                      ),
                    ),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor:
                          widget.fillColor ?? AppColors.scaffoldBackGround,
                      errorMaxLines: widget.errorMaxLines ?? 2,
                      suffixIcon: widget.suffixIcon ??
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                AssetIcons.call,
                                height: 20.h,
                                width: 20.w,
                                fit: BoxFit.contain,
                              ),
                            ],
                          ),
                      prefixIcon: widget.prefixIcon,
                      labelText: widget.labelText,
                      labelStyle: const TextStyle(color: AppColors.greyFont),
                      hintStyle: TextStyles.rubik13W400IconGrey,
                      hintText: widget.hintText,
                      disabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: widget.borderColor ?? const Color(0xFFDCDCDC),
                          width: 1.0,
                        ),
                        borderRadius:
                            BorderRadius.circular(widget.borderRadious ?? 12.r),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: widget.borderColor ?? const Color(0xFFDCDCDC),
                          width: 1.0,
                        ),
                        borderRadius:
                            BorderRadius.circular(widget.borderRadious ?? 12.r),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color(0xFFFF0000),
                          width: 1.0,
                        ),
                        borderRadius:
                            BorderRadius.circular(widget.borderRadious ?? 12.r),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(widget.borderRadious ?? 12.r),
                        borderSide: BorderSide(
                            color: widget.borderColor ?? AppColors.primary),
                      ),
                      contentPadding:
                          const EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: widget.borderColor ?? AppColors.red,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                    ),
                    languageCode: AssetTranslations.english.locale.languageCode,
                    onChanged: widget.onChanged,
                    onCountryChanged: widget.onCountryChanged ??
                        (country) {
                          setState(() {
                            initialCountry = country;
                          });

                          widget.onCountryChangedReturnApiCountry?.call(
                            state.countries.firstWhere(
                              (element) =>
                                  element.phoneCode == country.dialCode,
                            ),
                          );
                        },
                  ),
                ),
              ],
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
