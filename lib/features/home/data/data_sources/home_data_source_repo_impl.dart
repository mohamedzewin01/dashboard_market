
import 'package:injectable/injectable.dart';

import '../../../../core/api/api_extentions.dart';
import '../../../../core/api/api_manager/api_manager.dart';
import '../../../../core/common/api_result.dart';
import '../../domain/entities/home_entities.dart';
import 'home_data_source_repo.dart';

@Injectable(as: HomeDataSourceRepo)
class HomeDataSourceRepoImpl implements HomeDataSourceRepo {
  ApiService apiService;

  HomeDataSourceRepoImpl(this.apiService);

  @override
  Future<Result<HomeEntity?>> getHomeData(int idZone) {
    return executeApi(() async {
      // var response = await apiService.getHomeData(idZone);
      // return response.toHomeEntity();
    });
  }
}
