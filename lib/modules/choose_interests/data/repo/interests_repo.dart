import 'package:bulka/core/services/api_handler/api_error_handler.dart';
import 'package:bulka/core/services/network/dio_helper.dart';
import 'package:bulka/core/shared/entity/api_error_entity.dart';
import 'package:bulka/core/utils/constant/api_constance.dart';
import 'package:bulka/core/utils/home_utilites.dart';
import 'package:bulka/modules/choose_interests/data/entity/interests_entity.dart';
import 'package:bulka/modules/choose_interests/data/entity/send_interests_entity.dart';
import 'package:bulka/modules/choose_interests/data/model/interests_model.dart';
import 'package:bulka/modules/choose_interests/data/model/send_interests_model.dart';
import 'package:bulka/modules/choose_interests/data/params/send_interests_params.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class InterestsRepo extends Equatable {
  const InterestsRepo();
  Future<Either<ApiErrorEntity, List<InterestsEntity>>> getInterests() async {
    try {
      // final response = await DioHelper.get(ApiConstance.interests);

      // final List<InterestsEntity> data = checkFromArray(response.data)
      //     ? (response.data as List)
      //         .map((e) => InterestsModel.fromJson(e))
      //         .toList()
      //     : [];
      const data = [
        InterestsEntity(
          image:
              'https://s3-alpha-sig.figma.com/img/277f/4b89/b9db8b70271d8d5f4ad127054bb9cb02?Expires=1726444800&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=aXa9PYcK2Ni~ZUNWLzarVq9QeMsoa3nH3l6lId-2bah35wWMiznKLmJh-kuZhlKMpBJeyRb1QvQ0Wt0PX0hd9-zzLU05B6OLw0EW4TKqhRTCqiFAY6LS~3YMrrGIQ6gHYmfRmc7-RKcSP8vLqyeDS1Mkj9bdPfA7GBKpu82lgtkPw4Cr54JvDx3SvIcsXv2GQsUUaF6N5AsVPATHQeq0fsi0i69edq3T0lFSCF96GfNeByTuhKbhJ0XB9IbLwzjLdr5JvPV-Nuqj9~84pOM5Tguk~RnPz6x6c5sYNWMQEFdZ5uC11eV1ay2M3IQmDuLMy~wc5rDtGgAhaOtvI9atUQ__',
          name: 'Beauty',
          id: 1,
        ),
        InterestsEntity(
          image:
              'https://s3-alpha-sig.figma.com/img/a41d/e548/cda9492f2b051f807c76ed7d3fb15f28?Expires=1726444800&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=O9UoAW86TE6IUpWGMwk5N-4Qmh~D1cL-2OdOM6vNoFbpGyhSKXVWY-b3KfekFD8CA8eUhAXMN-sWMYGNwiYs3ftHfGoBUZpQZA-39nSxb7uVoRj305Yb-sovKhGSbcnx-kA8BoknF9Wsr1d1r-LYWTMfMp~X9EuH1y8fYdFTk1NKQmfjOtVWhuo2VPq7cBORaEqXTVZnC3BwTpoe11atpJTMeW5WkUpBjTpfwb~ppSuj6QzxQ0h4IVJejRJu50AGEDJaz3--io2~cR-~OKs-LAd1ciRsfU8VMct2GGHxj023p6juVpHy8WOHkNyqRFEqBBm0He72sPFcPnK-P3Fr1w__',
          name: 'Accessories',
          id: 2,
        ),
        InterestsEntity(
          image:
              'https://s3-alpha-sig.figma.com/img/3ddd/6e5c/c9d2906d8acf077a369721ba7df8e95b?Expires=1726444800&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=d49GKauPRhq3suqLQfLD0~4orVJWVgFD3M52INPD8oYasbDEAaMWXQnduNjjlzRDH2TPE~kKCUSdI0RxiJwaOiTReS1njGqtqkmadG1oG~wewNJdJty9kgiREJKLlrPezZadsJehN6MyXhGbnNTtKokGKeNl~kjVBt~YAXkXPKVi96xVSuJqgfx8398RyDBHQ3wuvlILFEBERDkFMbCNR58ZhQsjCUnoe1Kx9j-baMWa9dukBxyTy5o19QFXlzDcT5vWaT6~jlpLv83rj5JzNXSihm9BbKjIs26l30bVu59ZIVDqLTDpaUDknaqpSSyz5f6LsuTd7vbKFwIfS2rI4w__',
          name: 'Electronics',
          id: 3,
        ),
        InterestsEntity(
          image:
              'https://s3-alpha-sig.figma.com/img/523b/a282/9e219fb707224a9ed99d025233070cb5?Expires=1726444800&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=G5C9PQf6rL81ahdft8RfbL6rf5kNQXpsgSz8Lad2LrDzVVhDlcramp1AgxVSENqst0rOUulXn4Hbyvwxa4-BwcNpUHKYpUjyoAVejUSK0YNpxT0Wd-HAUS-97wVFYGc16ITc1BEuu-5bo2v-3LpLbraj1e-zQnbAn~PiXUug1QSSTZeeBosabyOW8kZZkTSai1-~aYes3c9qxfN-ZQ18C9YMb2-N1NyiXc4rH90qbhzRlRM17sWqtJsN4lbTngL3wsSzjRPooOKEJl8Sz-uaLA6-jFulY1q1HQmmFnoxG-cnKads~JtJQaBwlzsP6YHSaANhCjI4gNI1NcFndIPpmA__',
          name: 'Gift',
          id: 4,
        ),
        InterestsEntity(
          image:
              'https://s3-alpha-sig.figma.com/img/da55/368f/4268073bef3e891488bab8bd02605c3c?Expires=1726444800&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=qOFg30q4UgRjz3~JrFB07kDQLKyOyVU6C2OsTV~F-07bmRjjNrlGGMiDrOKO2oT7mM9GKTiVjk39LfWZpP2jFpQdJildr4P9I806xOcA~NYzTmB5pQZuaT3QNwMZEef6weDzNd7Crpx-5UtFN5EXkxzzveH9Oj55YCPjiHrP-l0MQU40nkgdvLZBIGftvS3S77iDGIyodhO1R1XRTvRBpVtZvTWXLZ62L5U4lS26wdrYp43mIeeaGjBWCnJDEQCgzKE7uZvSkDFor8SSUkLY-Mgt0ayz1EHLj~Mp6mqdXd5jSoYtebIgkVF-cOidaEHyQXdQ3KU8Xcf01BMEaasQgw__',
          name: 'Tech Gadgets',
          id: 5,
        ),
        InterestsEntity(
          image:
              'https://s3-alpha-sig.figma.com/img/02e1/381e/8e1eb8a849127a3a19cdb2a8d5ebd5e7?Expires=1726444800&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=LcUj7jIbkzWnExRS2BQ9WDq~HMnJ1oFIpSD-fj38bpkUF5bcWd5O16U6fw0NLlYbx~eWOhmt-12iVQnd9uOJlvnsTnO3ySzhnqWPxpDhc1o6fGJY3n~Visug5XW4isd5Ga63ehnmKHmCY2Eh6joNZCeTj53WBlmcDXNSYifsVUAnh9SuV7y-X76cm2XtR5nj8gRsZr7xfIhBAiq5DZ5-Q8BQA9jwKmnoVRIthQmb1e8CETZEh3g1Prwkk1jyZTdiiHmU6~W7wASZvHuoGNaMiVgMVUpd1I2UxKwxJj60kt9x56yaC6UnPXoAF~~a9S6ZoMJ9v1wwfcFcNA20c-H~Ew__',
          name: 'Books',
          id: 6,
        ),
      ];
      await Future.delayed(const Duration(seconds: 2));
      return Right(data);
    } catch (error) {
      return Left(ErrorHandler.handleError(error));
    }
  }

  Future<Either<ApiErrorEntity, SendInterestsEntity>> sendInterestsData(
      SendInterestsParams params) async {
    try {
      final response = await DioHelper.post(
        ApiConstance.interests,
        data: params.returnedMap(),
      );
      return Right(SendInterestsModel.fromJson(response.data));
    } catch (error) {
      return Left(ErrorHandler.handleError(error));
    }
  }

  @override
  List<Object?> get props => [];
}
