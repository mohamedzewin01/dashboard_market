import 'package:bloc/bloc.dart';
import 'package:dashboard_market/core/common/api_result.dart';
import 'package:dashboard_market/features/home/domain/entities/home_entity.dart';
import 'package:dashboard_market/features/home/domain/use_cases/use_case.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';


@injectable
class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this._homeUseCase) : super(HomeInitial());
  final HomeUseCase _homeUseCase;

  Future<void> getHomeData() async {
    emit(HomeLoading());
    final result = await _homeUseCase.getDashboardStatistics();
    switch (result) {
      case Success<HomeEntity?>():
        {
          if (!isClosed) {
            emit(HomeSuccess(result.data!));
          }
        }
      case Fail<HomeEntity>():
        {
          if (!isClosed) emit(HomeFail(result.exception));

        }
    }
  }

}
