import 'package:bulka/core/services/servies_locator/service_locator.dart';
import 'package:bulka/core/shared/widgets/carousal_widget.dart';
import 'package:bulka/core/shared/widgets/spacing.dart';
import 'package:bulka/core/theme/text_styles/text_styles.dart';
import 'package:bulka/core/utils/constant/app_colors.dart';
import 'package:bulka/core/utils/constant/app_strings.dart';
import 'package:bulka/core/utils/constant/strings.dart';
import 'package:bulka/core/utils/widgets/errors/error_full_screen.dart';
import 'package:bulka/modules/packages/controller/cubit/packages_cubit.dart';
import 'package:bulka/modules/packages/controller/cubit/packages_state.dart';
import 'package:bulka/modules/packages/data/params/subscribe_params.dart';
import 'package:bulka/modules/packages/views/widgets/subscribe_button_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PackagesScreen extends StatefulWidget {
  const PackagesScreen({super.key});

  @override
  State<PackagesScreen> createState() => _PackagesScreenState();
}

class _PackagesScreenState extends State<PackagesScreen> {
  int currentIndex = 0;
  bool isFouced = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Packages'),
      ),
      body: BlocProvider(
        create: (context) => PackagesCubit(sl())..packagesStatesHandled(),
        child: BlocBuilder<PackagesCubit, PackagesState>(
          buildWhen: (previous, current) =>
              current is GetPackagesLoading ||
              current is GetPackagesSuccess ||
              current is GetPackagesError,
          builder: (context, state) {
            final cubit = context.read<PackagesCubit>();
            if (state is GetPackagesLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is GetPackagesError) {
              return ErrorFullScreen(
                error: state.error,
                onPressed: () {
                  cubit.packagesStatesHandled();
                },
              );
            }
            if (cubit.packages != null || state is GetPackagesSuccess) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SharedCarousalWidget(
                    height: MediaQuery.sizeOf(context).height * .7,
                    activeImageIndex: (activeImageIndex) {
                      setState(() {
                        currentIndex = activeImageIndex;
                      });
                    },
                    viewportFraction: .8,
                    needCounter: true,
                    itemBuilder: (context, index, reelIndex) => Container(
                      height: 403,
                      width: MediaQuery.sizeOf(context).width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: currentIndex == index
                            ? AppColors.primary
                            : AppColors.white,
                        border: Border.all(
                          color: currentIndex == index
                              ? AppColors.primary
                              : AppColors.opactiyPrimary,
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: AppColors.white,
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 13, vertical: 8),
                                child: Text(
                                  cubit.packages![index].name,
                                  style: TextStyles.rubik13W500Primary.copyWith(
                                    color: const Color(0xFF573CFF),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Text(
                            "${currentLanguage?.currency} ${cubit.packages![index].price}",
                            style: TextStyles.rubik15W500Black.copyWith(
                              color: currentIndex == index
                                  ? AppColors.white
                                  : AppColors.black,
                              fontSize: 40,
                            ),
                          ),
                          Text(
                            AppStrings.whatsIncluded.tr(),
                            style: TextStyles.rubik15W500Black.copyWith(
                              color: AppColors.white.withOpacity(.5),
                              fontSize: 25,
                            ),
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.check_circle_outline,
                                color: AppColors.white,
                              ),
                              hSpace(10),
                              Expanded(
                                child: Text(
                                  '${cubit.packages![index].numberOfStanderedAds} ${AppStrings.adsStandard.tr()}',
                                  style: TextStyles.rubik15W500Black.copyWith(
                                    color: AppColors.white.withOpacity(.5),
                                    fontSize: 20,
                                  ),
                                ),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.check_circle_outline,
                                color: AppColors.white,
                              ),
                              hSpace(10),
                              Expanded(
                                child: Text(
                                  '${AppStrings.valid.tr()} ${cubit.packages![index].numberOfPromotionAds} ${AppStrings.days.tr()}',
                                  style: TextStyles.rubik15W500Black.copyWith(
                                    color: AppColors.white.withOpacity(.5),
                                    fontSize: 20,
                                  ),
                                ),
                              )
                            ],
                          ),
                          SubscribeButtonWidget(
                            params: SubscribeParams(
                              packageId: cubit.packages![index].id,
                            ),
                          )
                        ],
                      ),
                    ),
                    itemCount: cubit.packages!.length,
                  )
                ],
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
