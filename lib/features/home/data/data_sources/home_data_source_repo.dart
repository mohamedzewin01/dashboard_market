
import '../../../../core/common/api_result.dart';
import '../../domain/entities/home_entities.dart';

abstract class HomeDataSourceRepo {
  Future<Result<HomeEntity?>> getHomeData(int idZone);
}
