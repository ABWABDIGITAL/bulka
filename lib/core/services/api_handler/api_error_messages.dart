import 'package:equatable/equatable.dart';

class ApiErrorMessages extends Equatable {
  static const String connectionerror = 'connection error';
  static const String maybeerrorinserver = 'maybe error in server';
  static const String maybeinternetconnectionislost =
      'maybe internet connection is lost';
  static const String userCancelledSignIn = 'User cancelled sign in';

  @override
  List<Object?> get props =>
      [connectionerror, maybeerrorinserver, maybeinternetconnectionislost];
}
