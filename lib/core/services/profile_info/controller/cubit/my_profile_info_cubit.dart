import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:bulka/core/services/cache/shared_pref.dart';
import 'package:bulka/core/services/profile_info/controller/cubit/my_profile_info_state.dart';
import 'package:bulka/core/services/profile_info/data/entity/my_profile_info_entity.dart';
import 'package:bulka/core/services/profile_info/data/model/my_profile_info_model.dart';
import 'package:bulka/core/services/profile_info/data/repo/my_profile_info_repo.dart';
import 'package:bulka/core/utils/constant/shared_pref_keys.dart';
import 'package:bulka/core/utils/enums/enums.dart';
import 'package:bulka/core/utils/home_utilites.dart';
import 'package:flutter/material.dart';

class MyProfileInfoCubit extends Cubit<MyProfileInfoState> {
  final MyProfileInfoRepo _myProfileInfoRepo;
  MyProfileInfoCubit(this._myProfileInfoRepo) : super(MyProfileInfoInitial());
//---------------------------------VARIABLES----------------------------------//
  MyProfileInfoEntity? _profileEntity;

//---------------------------------FUNCTIONS----------------------------------//

  MyProfileInfoEntity? get profileEntity {
    return _profileEntity;
  }

  Future<void> saveMyProfileInfo(MyProfileInfoEntity info) async {
    final Map<String, dynamic> json = MyProfileInfoModel.toJson(info);
    try {
      await SharedPrefHelper.setSecuredString(
          SharedPrefKeys.profileInfo, jsonEncode(json));
      _profileEntity = await getMyProfileInfo();
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<MyProfileInfoEntity> getMyProfileInfo() async {
    try {
      final String? profileInfo =
          await SharedPrefHelper.getSecuredString(SharedPrefKeys.profileInfo);
      final Map<String, dynamic>? json =
          profileInfo != null ? jsonDecode(profileInfo) : null;
      return json != null ? MyProfileInfoModel.fromJson(json) : visitorData();
    } catch (e) {
      debugPrint(e.toString());
      return visitorData();
    }
  }

  MyProfileInfoEntity visitorData() {
    return const MyProfileInfoEntity(
      id: 0,
      fullName: 'Visitor',
      userType: UserType.visitor,
      email: 'visitor@visitor.com',
      phoneCode: '+20',
      phone: '1099293903',
      isActive: false,
      isBan: false,
      isNotified: false,
      avatar: null,
      companyData: null,
    );
  }

  Future<void> removeProfileData() async {
    try {
      await SharedPrefHelper.removeSecuredString(SharedPrefKeys.profileInfo);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

//----------------------------------REQUEST-----------------------------------//
  Future<void> profileStatesHandled() async {
    await getMyProfileInfo();
    emit(const MyProfileInfoLoading());
    final response = await _myProfileInfoRepo.profile();
    response.fold((failure) {
      return emit(MyProfileInfoError(failure));
    }, (success) async {
      await saveMyProfileInfo(success);
      return emit(MyProfileInfoSuccess(success));
    });
  }
}
