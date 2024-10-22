import 'package:equatable/equatable.dart';

class TermsEntity extends Equatable {
  final int id;
  final String title;
  final String description;

  const TermsEntity(
      {required this.id, required this.title, required this.description});

      
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
