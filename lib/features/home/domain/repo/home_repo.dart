import '../../../../core/common/api_result.dart';
import '../entities/home_entities.dart';

abstract class HomeRepo {
  Future<Result<HomeEntity?>> getHomeData();
}
