import 'package:bloc/bloc.dart';
import 'package:bulka/core/shared/entity/api_error_entity.dart';
import 'package:bulka/core/utils/constant/app_strings.dart';
import 'package:bulka/core/utils/widgets/format_date/date_format.dart';
import 'package:bulka/modules/work_experience/data/entities/job_titles_entity.dart';
import 'package:bulka/modules/work_experience/data/entities/work_experience_entity.dart';
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
  int? id;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isCurrentPosition = false;
  int? stillWorkng;
  String selectedJob = AppStrings.select.tr();
  int? selectedJobId;
  TextEditingController companyController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController startDateController =
      TextEditingController();
      TextEditingController endDateController =
      TextEditingController();
  DateTime? selectedStartDate;
  DateTime? selectedEndDate;

  bool editIsCurrentPosition = false;
  int? editStillWorkng;
  String? editSelectedJob;
  int? editSelectedJobId;
  TextEditingController editStartDateController =
      TextEditingController();
      TextEditingController editEndDateController =
      TextEditingController();
  TextEditingController editCompanyController = TextEditingController();
  TextEditingController editDescriptionController = TextEditingController();
  DateTime? editSelectedStartDate;
  DateTime? editSelectedEndDate;

  //------------------------------------------functions----------------------------------------//
  void onCurrentPosition(bool value) {
    isCurrentPosition = value;
    if (isCurrentPosition == false) {
      stillWorkng = 0;
    } else {
      stillWorkng = 1;
    }
    emit(WorkExperienceCurrentPosition());
  }
 

  void initValues(
    BuildContext context,
    WorkExperienceEntity workExperience,
  ) {
    id = workExperience.id;
    editCompanyController.text = workExperience.companyName;
    editDescriptionController.text = workExperience.description;
    editSelectedStartDate =
        DateFormats.convertStringToDateTime(workExperience.startDate);
    editSelectedEndDate =
        DateFormats.convertStringToDateTime(workExperience.endDate);
    editSelectedJob = workExperience.jobTitleName;
    editSelectedJobId = workExperience.jobTitleId;
    editIsCurrentPosition = workExperience.stillWorking == 1;
    editStillWorkng = workExperience.stillWorking;
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

  void getWorkExperiences() async {
    emit(GetWorkExperienceLoading());
    final response = await _workExperienceRepo.getAllWorkExperience();
    response.fold(
      (error) => emit(GetWorkExperienceError(error)),
      (workExperience) => emit(GetWorkExperienceLoaded(workExperience)),
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
        stillWorking: stillWorkng!);
    final response = await _workExperienceRepo.postWorkExperience(params);
    response.fold(
      (error) => emit(PostWorkExperienceError(error)),
      (jobTitles) => emit(PostWorkExperienceLoaded(jobTitles)),
    );
  }

  void postEditWorkExperience() async {
    emit(PostWorkExperienceLoading());
    final params = WorkExperienceParams(
        companyName: editCompanyController.text,
        description: editDescriptionController.text,
        jobTitleId: editSelectedJobId!,
        endDate: DateFormats.formatDateDayMonthYear(editSelectedEndDate!),
        startDate: DateFormats.formatDateDayMonthYear(editSelectedStartDate!),
        stillWorking: editStillWorkng!);
    final response = await _workExperienceRepo.postWorkExperience(params);
    response.fold(
      (error) => emit(PostWorkExperienceError(error)),
      (jobTitles) => emit(PostWorkExperienceLoaded(jobTitles)),
    );
  }

  void removeWorkExperience() async {
    emit(RemoveWorkExperienceLoading());

    final response = await _workExperienceRepo.removeWorkExperience(id!);
    response.fold(
      (error) => emit(PostWorkExperienceError(error)),
      (jobTitles) => emit(PostWorkExperienceLoaded(jobTitles)),
    );
  }
}
