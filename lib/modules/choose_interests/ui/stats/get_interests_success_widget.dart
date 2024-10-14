import 'package:bulka/modules/choose_interests/controllers/choose_interests_cubit.dart';
import 'package:bulka/modules/choose_interests/data/entity/interests_entity.dart';
import 'package:bulka/modules/choose_interests/ui/widgets/interests_container_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InterestsSuccessWidget extends StatelessWidget {
  const InterestsSuccessWidget({
    super.key,
    required this.interests,
    required this.gridDelegate,
  });
  final List<InterestsEntity> interests;
  final SliverGridDelegate gridDelegate;
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ChooseInterestsCubit>();
    return SliverGrid.builder(
      gridDelegate: gridDelegate,
      itemCount: interests.length,
      itemBuilder: (context, index) {
        return InterestsContainerWidget(
          isLoading: false,
          interests: interests[index],
          isSelected: cubit.isInterestExist(interests[index]),
          onTap: () {
            cubit.checkAndToggleInterest(interests[index]);
          },
        ).animate().fadeIn(delay: (index * 100).ms);
      },
    );
  }
}
