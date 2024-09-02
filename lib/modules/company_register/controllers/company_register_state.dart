import 'package:bulka/core/shared/entity/api_error_entity.dart';
import 'package:bulka/modules/company_register/data/entity/company_reigster_entity.dart';

sealed class CompanyRegisterState {
  const CompanyRegisterState();
}

final class CompanyRegisterInitial extends CompanyRegisterState {}

final class ChangePasswordStatus extends CompanyRegisterState {}

final class CompanyRegisterLoading extends CompanyRegisterState {}

final class CompanyRegisterSuccess extends CompanyRegisterState {
  CompanyRegisterSuccess(this.company);
  final CompanyRegisterEntity company;
}

final class CompanyRegisterError extends CompanyRegisterState {
  CompanyRegisterError(this.error);
  final ApiErrorEntity error;
}
