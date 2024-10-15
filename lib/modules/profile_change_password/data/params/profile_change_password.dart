import 'package:equatable/equatable.dart';

class ProfileChangePasswordParams extends Equatable {
  final String oldPassword;
  final String newPassword;

  const ProfileChangePasswordParams(
      {required this.oldPassword, required this.newPassword});

  Map<String, dynamic> toMap() {
    return {
      "old_password": oldPassword,
      "password": newPassword,
    };
  }
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
