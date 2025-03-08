import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../../core/common/api_result.dart';
import '../../domain/entities/products_entities.dart';
import '../../domain/use_cases/products_use_case.dart';

part 'home_state.dart';

@injectable
class HomeCubit extends Cubit<HomeState> {
  final HomeUseCase _homeUseCase;

  HomeCubit(this._homeUseCase) : super(HomeInitial());

  Future<void> getHomeData() async {
    emit(HomeLoading());
    final result = await _homeUseCase.getHomeData();
    switch (result) {
      case Success<ProductsEntity?>():
        {
          if (!isClosed) {
            emit(HomeSuccess(result.data));
          }
        }
      case Fail<ProductsEntity>():
        {
          emit(HomeFail(result.exception));
          log('HomeCubit: getHomeData: ${result.exception}');
        }
    }
  }
}
