import 'package:bulka/core/services/notifications/firebase_notification_api.dart';
import 'package:bulka/core/utils/home_utilites.dart';
import 'package:bulka/core/utils/widgets/device_type/device_type.dart';
import 'package:bulka/modules/authentication/login/controllers/login_state.dart';
import 'package:bulka/modules/authentication/login/data/params/login_located_params.dart';
import 'package:bulka/modules/authentication/login/data/params/login_params.dart';
import 'package:bulka/modules/authentication/login/data/repo/login_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo _loginRepo;
  LoginCubit(this._loginRepo) : super(const LoginInitial());
//---------------------------------VARIABLES----------------------------------//
  GlobalKey<FormState> loginKey = GlobalKey<FormState>();
  TextEditingController passwordCtr = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  bool _isVisiable = false;
  bool _isRememberMe = false;

//---------------------------------FUNCTIONS----------------------------------//
  bool get isVisiable => _isVisiable;
  bool get isRememberMe => _isRememberMe;
  void changeVisibility() {
    _isVisiable = !_isVisiable;
    emit(ChangePasswordStatus());
  }

  void changeRememberMe() {
    _isRememberMe = !_isRememberMe;
    emit(ChangeRememberMeStatus());
  }

  Future<Position?> _getCurrentPosition() async {
    return await getCurrentPosition();
  }

  Future<List<Placemark>?> _placemarkFromCoordinates(
      {double? latitude, double? longitude}) async {
    if (latitude == null || longitude == null) return null;
    await placemarkFromCoordinates(latitude, longitude);
    return null;
  }

  Future<LoginLocationParams> _loginLocation() async {
    Position? position = await _getCurrentPosition();
    if (position == null) {
      return const LoginLocationParams(lat: null, lng: null, location: null);
    }
    List<Placemark>? placemark = await _placemarkFromCoordinates(
      latitude: position.latitude,
      longitude: position.longitude,
    );

    return LoginLocationParams(
      lat: position.latitude,
      lng: position.longitude,
      location: placemark!.isNotEmpty ? placemark.first.name : null,
    );
  }

//----------------------------------REQUEST-----------------------------------//
  Future<void> loginStatesHandled(BuildContext context) async {
    emit(const LoginStateLoading());
    final LoginLocationParams locations = await _loginLocation();

    final response = await _loginRepo.login(
      LoginParams(
        phone: emailController.text,
        password: passwordController.text,
        email: emailController.text,
        deviceToken: fcmToken,
        deviceType: DeviceType.getDeviceType(),
        lat: locations.lat,
        lng: locations.lng,
        location: locations.location,
      ),
    );
    response.fold((failure) {
      return emit(LoginStateError(failure));
    }, (success) async {
      return emit(LoginStateSuccess(success));
    });
  }
}
