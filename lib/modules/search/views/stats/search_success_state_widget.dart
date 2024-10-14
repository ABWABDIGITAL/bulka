import 'package:bulka/core/utils/home_utilites.dart';
import 'package:bulka/modules/search/controller/cubit/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchSuccessStateWidget extends StatefulWidget {
  const SearchSuccessStateWidget({super.key, required this.gridDelegate});

  final SliverGridDelegate gridDelegate;

  @override
  State<SearchSuccessStateWidget> createState() =>
      _SearchSuccessStateWidgetState();
}

class _SearchSuccessStateWidgetState extends State<SearchSuccessStateWidget> {
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    final cubit = context.read<SearchCubit>();

    scrollController.addListener(() {
      if (scrollController.position.atEdge &&
          scrollController.position.pixels != 0) {
        if (cubit.searchEntity != null &&
            cubit.searchEntity!.paggination.lastPage >= cubit.page) {
          cubit.page++;
          cubit.searchStatesHandled();
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
    final cubit = context.read<SearchCubit>();
    return Padding(
      padding: const EdgeInsets.all(12),
      child: CustomScrollView(
        controller: scrollController,
        slivers: [
          SliverGrid.builder(
            gridDelegate: widget.gridDelegate,
            itemCount: cubit.searchEntity!.ads.length,
            itemBuilder: (context, index) {
              return getSuitableProductDetailsByType(
                context: context,
                mainInfo: cubit.searchEntity!.ads[index].mainInfo,
              );
            },
          ),
        ],
      ),
    );
  }
}
