import 'package:bloc/bloc.dart';
import 'package:bulka/core/shared/entity/api_error_entity.dart';
import 'package:bulka/core/utils/widgets/format_date/date_format.dart';
import 'package:bulka/modules/certifications/data/params/certification_params.dart';
import 'package:bulka/modules/certifications/data/repo/certification_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'certification_state.dart';

class CertificationCubit extends Cubit<CertificationState> {
  final CertificationRepo _certificationRepo;
  CertificationCubit(this._certificationRepo) : super(CertificationInitial());

  //-----------------------------------------variables----------------------------------------//
  TextEditingController certificationNameController = TextEditingController();
  TextEditingController certificationLinkController = TextEditingController();
  TextEditingController certificationDescriptionController =
      TextEditingController();
      TextEditingController endDateController = TextEditingController();
  DateTime? endDate;
  GlobalKey<FormState> certificationKey = GlobalKey<FormState>();

  //-----------------------------------------functions----------------------------------------//
  //-----------------------------------------requests----------------------------------------//
  void postCertification() async {
    emit(PostCertificationLoading());
    final params = CertificationParams(
      description: certificationDescriptionController.text,
      link: certificationLinkController.text,
      name: certificationNameController.text,
      endDate: DateFormats.formatDateDayMonthYear(endDate!),
    );
    //log('params : ${params.toMap()}');
    final response = await _certificationRepo.postCertification(params);
    response.fold(
      (error) => emit(PostCertificationError(error)),
      (jobTitles) => emit(PostCertificationLoaded(jobTitles)),
    );
  }
}
