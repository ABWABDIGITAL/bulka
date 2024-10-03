import 'package:bloc/bloc.dart';
import 'package:bulka/modules/jop_details/controllers/jop_details_state.dart';
import 'package:flutter/material.dart';

class JopDetailsCubit extends Cubit<JopDetailsState> {
  JopDetailsCubit() : super(JopDetailsInitial());
//---------------------------------VARIABLES----------------------------------//
  late TabController _tabController;

//---------------------------------FUNCTIONS----------------------------------//
  TabController get tabController => _tabController;

  void initTabController(TickerProvider vsync) {
    _tabController = TabController(length: 3, vsync: vsync);
  }

  void changeTabController(int index) {
    _tabController.animateTo(index);
    emit(UpdateTabController());
  }
//----------------------------------REQUEST-----------------------------------//
}
