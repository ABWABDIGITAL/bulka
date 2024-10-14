import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:bulka/modules/cv/controllers/add/add_cv_state.dart';
import 'package:bulka/modules/cv/data/params/cv_params.dart';
import 'package:bulka/modules/cv/data/repo/cv_repo.dart';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';

class AddCvCubit extends Cubit<AddCvState> {
  CvRepo _cvRepo;
  AddCvCubit(this._cvRepo) : super(AddCvInitial());
//---------------------------------VARIABLES----------------------------------//
  FilePickerResult? _pdfPickerResult;
//---------------------------------FUNCTIONS----------------------------------//
  FilePickerResult? get pdf => _pdfPickerResult;
  void pickPdfFile() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf'],
        allowMultiple: false,
      );
      if (result != null) {
        _pdfPickerResult = result;
        emit(PickedPdfFileSuccessState());
      } else {
        emit(PickedPdfFileErrorState(error: "You didn't choose a file"));
      }
    } catch (e) {
      print(e.toString());
      emit(PickedPdfFileErrorState(
          error: 'Error while picking the file cuz path is undefind'));
    }
  }

  void clearPickedFile() {
    _pdfPickerResult = null;
    emit(UpdatePickedFile());
  }

//----------------------------------REQUEST-----------------------------------//
  void postCv() async {
    emit(PostCvLoading());
    Map<String, dynamic> data = _pdfPickerResult == null
        ? {}
        : {
            'cvFile': MultipartFile.fromFileSync(
              _pdfPickerResult!.xFiles.first.path,
              filename: _pdfPickerResult!.xFiles.first.path.split("/").last,
            )
          };
    log(_pdfPickerResult!.xFiles.first.path);
    final params = CvParams(cvFile: data.isEmpty ? null : data['cvFile']);
    //log('params : ${params.toMap()}');
    final response = await _cvRepo.postCv(FormData.fromMap(params.toMap()));
    response.fold(
      (error) => emit(PostCvError(error)),
      (jobTitles) => emit(PostCvLoaded(jobTitles)),
    );
  }
}
