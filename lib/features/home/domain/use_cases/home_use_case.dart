
import 'package:injectable/injectable.dart';

import '../../../../core/common/api_result.dart';
import '../entities/home_entities.dart';
import '../repo/home_repo.dart';

@injectable
class HomeUseCase {
  HomeRepo homeRepo;

  HomeUseCase(this.homeRepo);

  Future<Result<HomeEntity?>> getHomeData(int idZone) {
    return homeRepo.getHomeData(idZone);
  }
}
