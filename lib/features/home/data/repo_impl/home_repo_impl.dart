
import 'package:injectable/injectable.dart';
import '../../../../core/common/api_result.dart';
import '../../domain/entities/home_entities.dart';
import '../../domain/repo/home_repo.dart';
import '../data_sources/home_data_source_repo.dart';

@Injectable(as: HomeRepo)
class HomeRepoImpl implements HomeRepo {
  HomeDataSourceRepo homeDataSourceRepo;

  HomeRepoImpl(this.homeDataSourceRepo);

  @override
  Future<Result<HomeEntity?>> getHomeData(int idZone) {
    return homeDataSourceRepo.getHomeData(idZone);
  }
}
