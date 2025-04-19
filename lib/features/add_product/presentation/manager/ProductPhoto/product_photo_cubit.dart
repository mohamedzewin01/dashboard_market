import 'package:bloc/bloc.dart';
import 'package:dashboard_market/core/common/api_result.dart';
import 'package:dashboard_market/features/add_product/domain/entities/add_product_entity.dart';
import 'package:dashboard_market/features/add_product/domain/use_cases/add_product_use_case.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'product_photo_state.dart';


@injectable
class ProductPhotoCubit extends Cubit<ProductPhotoState> {
  ProductPhotoCubit(this._addProductUseCase) : super(ProductPhotoInitial());
  final AddProductUseCase _addProductUseCase;



  Future<void> fetchImages() async {
    emit(ProductPhotoLoading());
    var result = await _addProductUseCase.getAllImages();
    switch (result) {
      case Success<AllImagesEntity?>():
        {
          if (!isClosed) {
            emit(ProductPhotoSuccess(result.data!));
          }
        }
      case Fail<AllImagesEntity?>():
        {
          emit(ProductPhotoFail(result.exception));
        }
    }
  }


}
