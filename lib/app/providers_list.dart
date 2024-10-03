import 'package:bulka/core/services/profile_info/controller/cubit/my_profile_info_cubit.dart';
import 'package:bulka/core/services/servies_locator/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> providersList = [
  BlocProvider(create: (context) => MyProfileInfoCubit(sl())),
];
