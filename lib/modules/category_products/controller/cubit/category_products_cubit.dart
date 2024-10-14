import 'package:bloc/bloc.dart';
import 'package:bulka/core/utils/enums/enums.dart';
import 'package:bulka/core/utils/widgets/responsive/responsive.dart';
import 'package:bulka/modules/category_products/controller/cubit/category_products_state.dart';
import 'package:bulka/modules/category_products/data/entity/category_products_entity.dart';
import 'package:bulka/modules/category_products/data/params/category_products_params.dart';
import 'package:bulka/modules/category_products/data/repo/category_products_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryProductsCubit extends Cubit<CategoryProductsState> {
  final CategoryProductsRepo _categoryProductsRepo;
  CategoryProductsCubit(this._categoryProductsRepo, this._categoryId)
      : super(CategoryProductsInitial());

//---------------------------------VARIABLES----------------------------------//
  CategoryProductsEntity? categoryProductsEntity;
  int page = 0;
  late final int _categoryId;
  CategoryProductsDisplayTypes _displayType = CategoryProductsDisplayTypes.grid;
//---------------------------------FUNCTIONS----------------------------------//
  SliverGridDelegate gridDelegate(BuildContext context) {
    return displayType == CategoryProductsDisplayTypes.list
        ? SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
            crossAxisSpacing: 15.w,
            mainAxisSpacing: 15.h,
            childAspectRatio: 1.5,
          )
        : SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount:
                Responsive.returnValueAdjustResponsive(context, 6, 5, 4, 3, 2),
            crossAxisSpacing: 15.w,
            mainAxisSpacing: 15.h,
            childAspectRatio: 0.7,
          );
  }

  CategoryProductsDisplayTypes get displayType => _displayType;
  void changeDisplayType(CategoryProductsDisplayTypes displayType) {
    _displayType = displayType;
    emit(ChangeDisplay());
  }

//----------------------------------REQUEST-----------------------------------//
  Future<void> categoryProductsStatesHandled() async {
    emit(const CategoryProductsLoading());
    final response = await _categoryProductsRepo.categoryProducts(
      CategoryProductsParams(
        page: page,
        categoryId: _categoryId,
      ),
    );
    response.fold((failure) {
      return emit(CategoryProductsError(failure));
    }, (success) async {
      if (categoryProductsEntity == null) {
        categoryProductsEntity = success;
      } else {
        categoryProductsEntity!.paggination = success.paggination;
        if (success.ads.isNotEmpty) {
          success.ads.map((e) => categoryProductsEntity!.ads.add(e)).toList();
        }
      }
      return emit(CategoryProductsSuccess(success));
    });
  }
}
