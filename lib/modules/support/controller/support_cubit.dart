import 'package:bloc/bloc.dart';
import 'package:bulka/core/shared/entity/api_error_entity.dart';
import 'package:bulka/modules/support/data/params/email_support_params.dart';
import 'package:bulka/modules/support/data/repo/support_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'support_state.dart';

class SupportCubit extends Cubit<SupportState> {
  final SupportRepo _supportRepo;
  SupportCubit(this._supportRepo) : super(SupportInitial());
  //-------------------------------------------------variables---------------------------------------//
  TextEditingController emailController = TextEditingController();
  TextEditingController subjectController = TextEditingController();
  TextEditingController messageController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  //-------------------------------------------------functions---------------------------------------//
  //-------------------------------------------------requests---------------------------------------//

  void sendEmail() async {
    emit(EmailSupportLoading());
    final params = EmailSupportParams(
      email: emailController.text,
      subject: subjectController.text,
      message: messageController.text,
    );
    final response = await _supportRepo.postEmailSupport(params);
    response.fold(
      (error) => emit(EmailSupportError(error)),
      (success) {
        emit(EmailSupportLoaded(success));
      },
    );
  }
}
