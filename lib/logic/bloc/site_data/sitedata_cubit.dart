import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../models/workshop/singlenote_model.dart';
import '../../data_cleaning/get_functions.dart';

part 'sitedata_state.dart';

class SitedataCubit extends Cubit<SitedataState> {
  SitedataCubit() : super(const SitedataInitial());

  void loadSiteData(String siteUrl) async {
    emit(const SitedataLoading());
    Map<String, dynamic>? rawSiteData = {};
    List<SingleNote>? notes = [];
    try {
      rawSiteData = await FetchFunctions.fetchSiteCleanData(siteUrl);
      notes = rawSiteData["data"];
      if (notes == null) {
        emit(SitedataError(rawSiteData["status"].toString()));
      } else {
        emit(SitedataSuccess(siteUrl, notes));
      }
    } catch (e) {
      emit(SitedataError(e.toString()));
    }
  }
}
