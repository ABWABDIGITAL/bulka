import 'package:bloc/bloc.dart';
import 'package:bulka/core/shared/entity/api_error_entity.dart';
import 'package:bulka/core/utils/constant/app_strings.dart';
import 'package:bulka/core/utils/widgets/format_date/date_format.dart';
import 'package:bulka/modules/work_experience/data/entities/job_titles_entity.dart';
import 'package:bulka/modules/work_experience/data/params/work_experience_params.dart';
import 'package:bulka/modules/work_experience/data/repo/work_experience_repo.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

part 'work_experience_state.dart';

class WorkExperienceCubit extends Cubit<WorkExperienceState> {
  final WorkExperienceRepo _workExperienceRepo;
  WorkExperienceCubit(this._workExperienceRepo)
      : super(WorkExperienceInitial());
  //------------------------------------------variables----------------------------------------//
  bool isCurrentPosition = false;
  String? stillWorkng;
  String selectedJob = AppStrings.select.tr();
  int? selectedJobId;
  TextEditingController companyController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  DateTime? selectedStartDate;
  DateTime? selectedEndDate;

  //------------------------------------------functions----------------------------------------//
  void onCurrentPosition(bool value) {
    isCurrentPosition = value;
    if(isCurrentPosition==false){
      stillWorkng='0';
    }else {stillWorkng='1';}
    emit(WorkExperienceCurrentPosition());
  }
  
  //------------------------------------------requests----------------------------------------//

  void getJobTitles() async {
    emit(GetJobTitlesLoading());
    final response = await _workExperienceRepo.getJobTitles();
    response.fold(
      (error) => emit(GetJobTitlesError(error)),
      (jobTitles) => emit(GetJobTitlesLoaded(jobTitles)),
    );
  }

  void postWorkExperience() async {
    emit(PostWorkExperienceLoading());
    final params = WorkExperienceParams(
        companyName: companyController.text,
        description: descriptionController.text,
        jobTitleId: selectedJobId!,
        endDate: DateFormats.formatDateDayMonthYear(selectedEndDate!),
        startDate: DateFormats.formatDateDayMonthYear(selectedStartDate!),
        stillWorking:stillWorkng! );
    final response = await _workExperienceRepo.postWorkExperience(params);
    response.fold(
      (error) => emit(PostWorkExperienceError(error)),
      (jobTitles) => emit(PostWorkExperienceLoaded(jobTitles)),
    );
  }
}
