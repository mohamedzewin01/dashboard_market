


import 'package:dashboard_market/core/common/api_result.dart';
import 'package:dashboard_market/features/banners/domain/entities/banners_entity.dart';
import 'package:dashboard_market/features/banners/domain/repo/banners_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class BannersUseCases {

  final BannersRepo bannersRepo;

  BannersUseCases(this.bannersRepo);

  Future<Result<BannersEntity?>> fetchBanners() => bannersRepo.fetchBannersData();

}