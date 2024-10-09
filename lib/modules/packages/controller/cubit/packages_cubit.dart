import 'package:bloc/bloc.dart';
import 'package:bulka/modules/packages/controller/cubit/packages_state.dart';
import 'package:bulka/modules/packages/data/entity/packages_entity.dart';
import 'package:bulka/modules/packages/data/entity/subscribe_entity.dart';
import 'package:bulka/modules/packages/data/params/pay_subscribtion_params.dart';
import 'package:bulka/modules/packages/data/params/subscribe_params.dart';
import 'package:bulka/modules/packages/data/repo/packages_repo.dart';

class PackagesCubit extends Cubit<PackagesState> {
  final PackagesRepo _packagesRepo;
  PackagesCubit(this._packagesRepo) : super(PackagesInitial());
//---------------------------------VARIABLES----------------------------------//
  List<PackagesEntity>? packages;
  SubscribeEntity? subscribe;
//---------------------------------FUNCTIONS----------------------------------//

//----------------------------------REQUEST-----------------------------------//
  Future<void> packagesStatesHandled() async {
    emit(const GetPackagesLoading());
    final response = await _packagesRepo.packages();
    response.fold((failure) {
      return emit(GetPackagesError(failure));
    }, (success) async {
      packages = success;
      return emit(GetPackagesSuccess(success));
    });
  }

  Future<void> subscribeStatesHandled(SubscribeParams params) async {
    emit(const GetSubscribeLoading());
    final response = await _packagesRepo.subscribe(params);
    response.fold((failure) {
      return emit(GetSubscribeError(failure));
    }, (success) async {
      subscribe = success;
      return emit(GetSubscribeSuccess(success));
    });
  }

  Future<void> paySubscribtionStatesHandled(
      PaySubscribtionParams params) async {
    emit(const PaySubscribtionLoading());
    final response = await _packagesRepo.paySubscribtion(params);
    response.fold((failure) {
      return emit(PaySubscribtionError(failure));
    }, (success) async {
      return emit(PaySubscribtionSuccess(success));
    });
  }
}
