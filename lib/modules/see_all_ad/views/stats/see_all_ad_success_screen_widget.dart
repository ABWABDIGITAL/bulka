import 'package:bulka/core/shared/components/pagination_loading.dart';
import 'package:bulka/core/utils/home_utilites.dart';
import 'package:bulka/modules/see_all_ad/controller/see_all_ad_cubit.dart';
import 'package:bulka/modules/see_all_ad/data/params/see_all_params.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SeeAllAdSuccessScreenWidget extends StatefulWidget {
  const SeeAllAdSuccessScreenWidget(this.params, {super.key});
  final SeeAllParams params;
  @override
  State<SeeAllAdSuccessScreenWidget> createState() =>
      _SeeAllAdSuccessScreenWidgetState();
}

class _SeeAllAdSuccessScreenWidgetState
    extends State<SeeAllAdSuccessScreenWidget> {
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    final cubit = context.read<SeeAllAdCubit>();

    scrollController.addListener(() {
      if (scrollController.position.atEdge &&
          scrollController.position.pixels != 0) {
        if (cubit.seeAllAdEntity != null &&
            cubit.seeAllAdEntity!.paggination.lastPage >= cubit.page) {
          cubit.page++;
          cubit.seeAllAdStatesHandled(widget.params);
        }
      }
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SeeAllAdCubit>();
    return CustomScrollView(
      controller: scrollController,
      slivers: [
        SliverGrid.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1,
            mainAxisSpacing: 15,
            crossAxisSpacing: 15,
          ),
          itemCount: cubit.seeAllAdEntity!.ads.length,
          itemBuilder: (context, index) {
            return getSuitableProductDetailsByType(
              context: context,
              mainInfo: cubit.seeAllAdEntity!.ads[index].mainInfo,
            );
          },
        ),
      ],
    );
  }
}
