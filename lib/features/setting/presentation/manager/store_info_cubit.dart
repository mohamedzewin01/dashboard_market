import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dashboard_market/features/setting/data/models/store_info_request.dart';
import 'package:dashboard_market/features/setting/domain/use_cases/store_info_use_cases.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../../core/common/api_result.dart';
import '../../domain/entities/store_entity.dart';

part 'store_info_state.dart';

@injectable
class StoreInfoCubit extends Cubit<StoreInfoState> {
  StoreInfoCubit(this._storeInfoUseCases) : super(StoreInfoInitial());
  final StoreInfoUseCases _storeInfoUseCases;

  Future<void> getStoreInfo() async {
    emit(StoreInfoLoading());
    final result = await _storeInfoUseCases.getStoreInfo();
    switch (result) {
      case Success<StoreInfoEntity?>():
        emit(StoreInfoSuccess(result.data!));

      case Fail<StoreInfoEntity?>():
        emit(StoreInfoFailure(result.exception));
    }
  }


  String imagePath = '';
  String imageName = '';
  int status = 1;
  File? imageFile;
  TextEditingController discreptionController = TextEditingController();
  TextEditingController storeDiscountTitleController = TextEditingController();
  TextEditingController storeNameController = TextEditingController();
  Future<void> editStoreInfo() async {
    StoreInfoRequest storeInfoRequest = StoreInfoRequest(
      storeDescreption: discreptionController.text,
      storeDiscountTitle: storeDiscountTitleController.text,
      storeId: 1,
      storeName:storeNameController.text,
    );
    await _storeInfoUseCases.editStoreInfo(storeInfoRequest);
  }


  Future<void> uploadImageStore()async {
   await _storeInfoUseCases.uploadImageStore(imageFile??File(''), imageName);
  }

}
