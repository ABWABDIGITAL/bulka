import 'package:bulka/core/shared/entity/api_error_entity.dart';

sealed class AddCvState {}

final class AddCvInitial extends AddCvState {}

final class PickedPdfFileSuccessState extends AddCvState {}

final class PickedPdfFileErrorState extends AddCvState {
  final String error;
  PickedPdfFileErrorState({required this.error});
}

final class UpdatePickedFile extends AddCvState {}
//--------------------------------Post Cv--------------------------//

final class PostCvLoading extends AddCvState {}

final class PostCvError extends AddCvState {
  final ApiErrorEntity error;

   PostCvError(this.error);
}

final class PostCvLoaded extends AddCvState {
  final String message;

   PostCvLoaded(this.message);
}
