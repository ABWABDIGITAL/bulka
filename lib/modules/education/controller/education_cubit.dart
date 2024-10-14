import 'package:bloc/bloc.dart';
import 'package:bulka/core/shared/entity/api_error_entity.dart';
import 'package:bulka/core/utils/constant/app_strings.dart';
import 'package:bulka/core/utils/widgets/format_date/date_format.dart';
import 'package:bulka/modules/education/data/entities/education_degree_entity.dart';
import 'package:bulka/modules/education/data/entities/education_entity.dart';
import 'package:bulka/modules/education/data/entities/education_university_entity.dart';
import 'package:bulka/modules/education/data/params/education_params.dart';
import 'package:bulka/modules/education/data/repo/education_repo.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

part 'education_state.dart';

class EducationCubit extends Cubit<EducationState> {
  final EducationRepo _educationRepo;
  EducationCubit(this._educationRepo) : super(EducationInitial());
  //------------------------------------------variables----------------------------------------//
  int? id;

  bool isCurrentPosition = false;
  int? stillStudy;
  String selectedDegree = AppStrings.select.tr();
  int? selectedDegreeId;
  String selectedUniversity = AppStrings.select.tr();
  int? selectedUniversityId;
  TextEditingController descriptionController = TextEditingController();
  DateTime? selectedStartDate;
  DateTime? selectedEndDate;

  bool editIsCurrentPosition = false;
  int? editStillStudy;
  String? editSelectedEducationDegree;
  int? editSelectedEducationDegreeId;
  String? editSelectedUniversity;
  int? editSelectedUniversityId;
  TextEditingController editDescriptionController = TextEditingController();
  DateTime? editSelectedStartDate;
  DateTime? editSelectedEndDate;
  //------------------------------------------functions----------------------------------------//
  void onCurrentPosition(bool value) {
    isCurrentPosition = value;
    editIsCurrentPosition = value;
    if (isCurrentPosition == false) {
      stillStudy = 0;
    } else {
      stillStudy = 1;
    }
    emit(EducationCurrentPosition());
  }

  void initValues(
    BuildContext context,
    EducationEntity educationDegree,
  ) {
    id = educationDegree.id;
    editSelectedUniversity = educationDegree.universityName;
    editSelectedUniversityId = educationDegree.universityId;
    editDescriptionController.text = educationDegree.description;
    editSelectedStartDate =
        DateFormats.convertStringToDateTime(educationDegree.startDate);
    editSelectedEndDate =
        DateFormats.convertStringToDateTime(educationDegree.endDate);
    editSelectedEducationDegree = educationDegree.educationTitleName;
    editSelectedEducationDegreeId = educationDegree.educationId;
    editIsCurrentPosition = educationDegree.stillStudy == 1;
    editStillStudy = educationDegree.stillStudy;
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

  void getEducationUniversity() async {
    emit(GetEducationUniversityLoading());
    final response = await _educationRepo.getEducationUniversity();
    response.fold(
      (error) => emit(GetEducationUniversityError(error)),
      (educationUniversity) =>
          emit(GetEducationUniversityLoaded(educationUniversity)),
    );
  }

  void getEducation() async {
    emit(GetEducationLoading());
    final response = await _educationRepo.getAllEducations();
    response.fold(
      (error) => emit(GetEducationError(error)),
      (workExperience) => emit(GetEducationLoaded(workExperience)),
    );
  }

  void postEducation() async {
    emit(PostEducationLoading());
    final params = EducationParams(
        universityName: selectedUniversity,
        universityId: selectedUniversityId!,
        description: descriptionController.text,
        educationId: selectedDegreeId!,
        endDate: DateFormats.formatDateDayMonthYear(selectedEndDate!),
        startDate: DateFormats.formatDateDayMonthYear(selectedStartDate!),
        stillStudy: stillStudy!);
    //log('params : ${params.toMap()}');
    final response = await _educationRepo.postEducation(params);
    response.fold(
      (error) => emit(PostEducationError(error)),
      (jobTitles) => emit(PostEducationLoaded(jobTitles)),
    );
  }

  void postEditEducation() async {
    emit(PostEducationLoading());
    final params = EducationParams(
        universityName: editSelectedUniversity!,
        universityId: editSelectedUniversityId!,
        description: editDescriptionController.text,
        educationId: editSelectedEducationDegreeId!,
        endDate: DateFormats.formatDateDayMonthYear(editSelectedEndDate!),
        startDate: DateFormats.formatDateDayMonthYear(editSelectedStartDate!),
        stillStudy: editStillStudy!);
    final response = await _educationRepo.postEducation(params);
    response.fold(
      (error) => emit(PostEducationError(error)),
      (jobTitles) => emit(PostEducationLoaded(jobTitles)),
    );
  }

  void removeEducation() async {
    emit(RemoveEducationLoading());

    final response = await _educationRepo.removeEducation(id!);
    response.fold(
      (error) => emit(PostEducationError(error)),
      (jobTitles) => emit(PostEducationLoaded(jobTitles)),
    );
  }
}
