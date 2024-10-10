import 'package:bulka/core/services/ad_details/data/entity/ad_details_entity.dart';
import 'package:bulka/core/shared/entity/api_error_entity.dart';

sealed class AdDetailsState {
  const AdDetailsState();
}

final class AdDetailsInitial extends AdDetailsState {}

final class AdDetailsLoading extends AdDetailsState {
  const AdDetailsLoading();
}

final class AdDetailsSuccess extends AdDetailsState {
  AdDetailsSuccess(this.adDetails);
  final AdDetailsEntity adDetails;
}

final class AdDetailsError extends AdDetailsState {
  AdDetailsError(this.error);
  final ApiErrorEntity error;
}
