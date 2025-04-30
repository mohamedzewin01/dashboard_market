
import 'package:dashboard_market/core/common/api_result.dart';
import 'package:dashboard_market/features/banners/domain/entities/banners_entity.dart';
import 'package:dashboard_market/features/banners/domain/use_cases/banners_use_cases.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';


part 'banners_state.dart';

@injectable
class BannersCubit extends Cubit<BannersState> {
  BannersCubit(this._bannersUseCases) : super(BannersInitial());

  final BannersUseCases _bannersUseCases;

  static BannersCubit get(context) => BlocProvider.of(context);

  int status = 1;
  void changeSwitchStatus(int value) {
    status = value;
    emit(BannersInitial());
  }


  Future<void> fetchBanners() async {
    emit(BannersLoading());
    final result = await _bannersUseCases.fetchBanners();

    switch (result) {
      case Success<BannersEntity?>():
        if (!isClosed) {
          emit(BannersSuccess(result.data!));
        }
      case Fail<BannersEntity?>():
        if (!isClosed) {
          emit(BannersFailure(result.exception));
        }
    }
  }


  Future<void> deleteBanner({required int? bannerId,required String? imagePath}) async {

    await _bannersUseCases.deleteBanner(bannerId, imagePath);
    fetchBanners();
  }
  Future<void> changeStatus({required int bannerId, required int status})async{
   await _bannersUseCases.changeStatus(bannerId, status);
  }
}
