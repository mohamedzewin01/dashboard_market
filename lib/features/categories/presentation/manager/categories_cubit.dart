import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../../core/common/api_result.dart';
import '../../domain/entities/fetch_categories.dart';
import '../../domain/use_cases/categories_use_case.dart';

part 'categories_state.dart';
@injectable
class CategoriesCubit extends Cubit<CategoriesState> {
  final CategoriesUseCase _categoriesUseCase;
  CategoriesCubit(this._categoriesUseCase) : super(CategoriesInitial());


  Future<void> getCategoriesData() async {
    emit(CategoriesLoading());
    final result = await _categoriesUseCase.getCategoriesData();
    switch (result) {
      case Success<FetchCategoriesEntity?>():
        {
          if (!isClosed) {
            emit(CategoriesSuccess(result.data!));
          }
        }
        break;
      case Fail<FetchCategoriesEntity?>():
        {
          emit(CategoriesFailure(result.exception));
        }
        break;
    }

  }
}
