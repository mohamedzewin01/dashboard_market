import 'package:bloc/bloc.dart';
import 'package:dashboard_market/core/common/api_result.dart';
import 'package:dashboard_market/features/categories/domain/entities/fetch_categories.dart';
import 'package:dashboard_market/features/categories/domain/use_cases/categories_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'products_by_category_state.dart';
@injectable
class ProductsByCategoryCubit extends Cubit<ProductsByCategoryState> {
  ProductsByCategoryCubit(this._categoriesUseCase) : super(ProductsByCategoryInitial());

  final CategoriesUseCase _categoriesUseCase;
  static ProductsByCategoryCubit get(context) => BlocProvider.of(context);

  Future<void> getProductsByCategory({required int? idCategory}) async {
    emit(ProductsByCategoryLoading());
    final result = await _categoriesUseCase.getProductByCategories(idCategory);
    switch (result) {
      case Success<ProductsByCategoriesEntity?>():
        {
          if (!isClosed) {
            emit(ProductsByCategorySuccess(result.data!));
          }
        }
        break;
      case Fail<ProductsByCategoriesEntity?>():
        {
          emit(ProductsByCategoryFail(result.exception));
        }
        break;
    }
  }

}
