import 'package:equatable/equatable.dart';

class SharedPrefKeys extends Equatable {
  static const String userToken = 'userToken';
  static const String savedLang = 'savedLang';
  static const String isShownOboarding = 'isShownOboarding';
  static const String profileInfo = 'profileInfo';

  @override
  List<Object?> get props => [userToken];
}
