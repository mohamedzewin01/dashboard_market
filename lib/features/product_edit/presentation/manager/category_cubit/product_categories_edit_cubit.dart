import 'package:bloc/bloc.dart';
import 'package:dashboard_market/core/common/api_result.dart';
import 'package:dashboard_market/features/product_edit/domain/entities/edit_product_entity.dart';
import 'package:dashboard_market/features/product_edit/domain/use_cases/products_use_case.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'product_categories_edit_state.dart';


@injectable
class ProductCategoriesEditCubit extends Cubit<ProductCategoriesEditState> {
  ProductCategoriesEditCubit(this._productsEditUseCase)
      : super(ProductCategoriesEditInitial());

  final ProductsEditUseCase _productsEditUseCase;

  Future<void> getCategoriesToEdit() async {
    emit(ProductCategoriesEditLoading());
    final result = await _productsEditUseCase.getCategoriesToEdit();

    switch (result) {
      case Success<FetchCategoriesEditEntity?>():
        {
          if (!isClosed) {
            emit(ProductCategoriesEditSuccess(result.data!));
          }
        }
      case Fail<FetchCategoriesEditEntity?>():
        {
          if (!isClosed) emit(ProductCategoriesEditFail(result.exception));
        }
    }
  }
}
