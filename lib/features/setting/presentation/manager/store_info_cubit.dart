import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dashboard_market/features/setting/domain/use_cases/store_info_use_cases.dart';
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
  int status = 1;
  File? imageFile;
}
