sealed class AddCvState {}

final class AddCvInitial extends AddCvState {}

final class PickedPdfFileSuccessState extends AddCvState {}

final class PickedPdfFileErrorState extends AddCvState {
  final String error;
  PickedPdfFileErrorState({required this.error});
}

final class UpdatePickedFile extends AddCvState {}
