import 'package:equatable/equatable.dart';

class AboutUsEntity extends Equatable {
  final String name;
  final String link;

  const AboutUsEntity({required this.name, required this.link});
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
