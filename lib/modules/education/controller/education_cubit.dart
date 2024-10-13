import 'package:bloc/bloc.dart';
import 'package:bulka/core/shared/entity/api_error_entity.dart';
import 'package:bulka/core/utils/constant/app_strings.dart';
import 'package:bulka/core/utils/widgets/format_date/date_format.dart';
import 'package:bulka/modules/education/data/entities/education_degree_entity.dart';
import 'package:bulka/modules/education/data/params/education_params.dart';
import 'package:bulka/modules/education/data/repo/education_repo.dart';
import 'package:flutter/material.dart';

part 'education_state.dart';

class EducationCubit extends Cubit<EducationState> {
  final EducationRepo _educationRepo;
  EducationCubit(this._educationRepo) : super(EducationInitial());
  //------------------------------------------variables----------------------------------------//
 
  bool isCurrentPosition = false;
  String? stillWorkng;
  String selectedDegree = AppStrings.select.tr();
  int? selectedDegreeId;
  TextEditingController companyController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  DateTime? selectedStartDate;
  DateTime? selectedEndDate;
  //------------------------------------------functions----------------------------------------//
  void onCurrentPosition(bool value) {
    isCurrentPosition = value;
    emit(EducationCurrentPosition());
  }
  //------------------------------------------requests----------------------------------------//

   void getEducationDegree() async {
    emit(GetEducationDegreeLoading());
    final response = await _educationRepo.getEducationDegree();
    response.fold(
      (error) => emit(GetEducationDegreeError(error)),
      (educationDegree) => emit(GetEducationDegreeLoaded(educationDegree)),
    );
  }

  void postEducation() async {
    emit(PostEducationLoading());
    final params = EducationParams(
        companyName: companyController.text,
        description: descriptionController.text,
        educationId: selectedDegreeId!,
        endDate: DateFormats.formatDateDayMonthYear(selectedEndDate!),
        startDate: DateFormats.formatDateDayMonthYear(selectedStartDate!),
        stillWorking:stillWorkng! );
    final response = await _educationRepo.postEducation(params);
    response.fold(
      (error) => emit(PostEducationError(error)),
      (jobTitles) => emit(PostEducationLoaded(jobTitles)),
    );
  }
}
