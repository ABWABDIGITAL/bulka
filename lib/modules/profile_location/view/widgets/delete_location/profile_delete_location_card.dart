import 'package:bulka/modules/profile_location/controller/profile_location_cubit.dart';
import 'package:bulka/modules/profile_location/view/widgets/all_locations/profile_all_locations_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileDeleteLocationRow extends StatelessWidget {
  const ProfileDeleteLocationRow({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ProfileLocationCubit>();
    return Row(
      children: [
        const Expanded(child: ProfileAllLocationsCard()),
        BlocBuilder<ProfileLocationCubit, ProfileLocationState>(
          buildWhen: (previous, current) =>
              current is ProfileLocationLoading ||
              current is ProfileLocationLoaded ||
              current is ProfileLocationError,
          builder: (context, state) {
            return Checkbox.adaptive(
                value: cubit.isChecked,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4)),
                onChanged: (value) {
                  cubit.deleteCheckedLocaiton(value);
                });
          },
        )
      ],
    );
  }
}
