import 'package:bulka/core/services/profile_info/controller/cubit/my_profile_info_cubit.dart';
import 'package:bulka/core/shared/entity/api_error_entity.dart';
import 'package:bulka/modules/contact_info/data/params/contact_info_verify_email_params.dart';
import 'package:bulka/modules/contact_info/data/params/contact_info_verify_phone_entity.dart';
import 'package:bulka/modules/contact_info/data/repo/contact_info_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'contact_info_state.dart';

class ContactInfoCubit extends Cubit<ContactInfoState> {
  final ContactInfoRepo _contactInfoRepo;
  ContactInfoCubit(this._contactInfoRepo) : super(ContactInfoInitial());
  //-----------------------------------------------variables-----------------------------------//
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  bool _isOtpFilled = false;
  bool isOldPhone = true;
  bool isUpdatedPhone = false;
  bool isOldEmail = true;
  bool isUpdatedEmail = false;
  final TextEditingController otpController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
 
//---------------------------------FUNCTIONS----------------------------------//
  bool get isOtpFilled => _isOtpFilled;
  void otpFilled() {
    if (otpController.text.length == 6) {
      _isOtpFilled = true;
    } else {
      _isOtpFilled = false;
    }
    emit(ContactInfoVerifyPhoneOtpFilled());
  }

  void editPhone() {
    isOldPhone = false;
    
    emit(ContactInfoEditPhone());
  }

  void checkPhoneValue(BuildContext context) {
    if (phoneController.text ==
        context.read<MyProfileInfoCubit>().profileEntity?.phone) {
      isUpdatedPhone = false;
    } else {
      isUpdatedPhone = true;
    }
    emit(ContactInfoCheckPhoneValue());
  }

 void editEmail() {
    isOldEmail = false;
    
    emit(ContactInfoEditEmail());
  }

  void checkEmailValue(BuildContext context) {
    if (emailController.text ==
        context.read<MyProfileInfoCubit>().profileEntity?.email) {
      isUpdatedEmail = false;
    } else {
      isUpdatedEmail = true;
    }
    emit(ContactInfoCheckEmailValue());
  }

  void initControllerValues(BuildContext context) {
    phoneController.text =
        context.read<MyProfileInfoCubit>().profileEntity?.phone ?? 'no phone';
    emailController.text =
        context.read<MyProfileInfoCubit>().profileEntity?.email ?? 'no email';
  }

  //-----------------------------------------------requests-----------------------------------//
  void updatePhone() async {
    emit(const ContactInfoUpdatePhoneLoading());
    final params = ContactInfoVerifyPhoneParams(
        phone: phoneController.text, phoneCode: otpController.text);
    //log('params : ${params.toMap()}');
    final response = await _contactInfoRepo.postUpdatePhone(params);
    response.fold(
      (error) => emit(ContactInfoUpdatePhoneError(error)),
      (jobTitles) => emit(ContactInfoUpdatePhoneSuccess(jobTitles)),
    );
  }
   void verifyUpdatedPhone() async {
    emit(const ContactInfoVerifyPhoneOtpLoading());
    final params = ContactInfoVerifyPhoneParams(
        phone: phoneController.text, phoneCode: otpController.text);
    //log('params : ${params.toMap()}');
    final response = await _contactInfoRepo.postVerifyPhone(params);
    response.fold(
      (error) => emit(ContactInfoVerifyPhoneOtpError(error)),
      (jobTitles) => emit(ContactInfoVerifyPhoneOtpSuccess(jobTitles)),
    );
  }
  void updateEmail() async {
    emit(const ContactInfoUpdateEmailLoading());
    final params = ContactInfoVerifyEmailParams(
        email: emailController.text, );
    //log('params : ${params.toMap()}');
    final response = await _contactInfoRepo.postUpdateEmail(params);
    response.fold(
      (error) => emit(ContactInfoUpdateEmailError(error)),
      (jobTitles) => emit(ContactInfoUpdateEmailSuccess(jobTitles)),
    );
  }
   void verifyUpdatedEmail() async {
    emit(const ContactInfoVerifyEmailOtpLoading());
    final params = ContactInfoVerifyEmailParams(
        email: emailController.text, code: otpController.text);
    //log('params : ${params.toMap()}');
    final response = await _contactInfoRepo.postVerifyEmail(params);
    response.fold(
      (error) => emit(ContactInfoVerifyEmailOtpError(error)),
      (jobTitles) => emit(ContactInfoVerifyEmailOtpSuccess(jobTitles)),
    );
  }
}
