import 'package:dashboard_market/core/common/api_result.dart';
import 'package:dashboard_market/features/home/domain/entities/home_entity.dart';
import 'package:dashboard_market/features/home/domain/repo/home_repo.dart';
import 'package:injectable/injectable.dart';


@injectable
class HomeUseCase {
  final HomeRepo homeRepo;

  HomeUseCase(this.homeRepo);

  Future<Result<HomeEntity?>> getDashboardStatistics() =>
      homeRepo.getDashboardStatistics();
}
