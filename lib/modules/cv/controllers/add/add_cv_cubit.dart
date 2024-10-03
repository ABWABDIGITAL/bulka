import 'package:bloc/bloc.dart';
import 'package:bulka/modules/cv/controllers/add/add_cv_state.dart';
import 'package:file_picker/file_picker.dart';

class AddCvCubit extends Cubit<AddCvState> {
  AddCvCubit() : super(AddCvInitial());
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
}
