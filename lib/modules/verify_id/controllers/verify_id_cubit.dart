import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:bulka/core/shared/entity/api_error_entity.dart';
import 'package:bulka/modules/verify_id/data/params/verify_id_params.dart';
import 'package:bulka/modules/verify_id/data/repo/verify_id_repo.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

part 'verify_id_state.dart';

class VerifyIdCubit extends Cubit<VerifyIdState> {
  final VerifyIdRepo _verifyIdRepo;
  VerifyIdCubit(this._verifyIdRepo) : super(VerifyIdInitial());
  //----------------------------------------variables-------------------------------------------//
  File? idImage;
  File? selfImage;
  int currentContentIndex = 0;
  //----------------------------------------functions-------------------------------------------//
  void updateIndex() {
    currentContentIndex++;
  
    emit(VerifyIdUpdateIndex());
  }

  //----------------------------------------requests-------------------------------------------//
  void postVerifyId() async {
    emit(VerifyIdLoading());
    Map<String, dynamic> data = idImage == null
        ? {}
        : {
            'idImage': MultipartFile.fromFileSync(
              idImage!.path,
              filename: idImage!.path.split("/").last,
            )
          };
    final params = VerifyIdParams(
      id: data.isEmpty ? null : data['idImage'],
    );

    final response = await _verifyIdRepo.postVerifyId(params);

    response.fold(
      (error) => emit(VerifyIdError(error)),
      (response) => emit(VerifyIdLoaded(response)),
    );
  }
}
