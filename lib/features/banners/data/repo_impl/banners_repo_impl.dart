import 'package:dashboard_market/core/common/api_result.dart';
import 'package:dashboard_market/features/banners/data/data_sources/banners_data_source_repo_impl.dart';
import 'package:dashboard_market/features/banners/domain/entities/banners_entity.dart';
import 'package:dashboard_market/features/banners/domain/repo/banners_repo.dart';
import 'package:injectable/injectable.dart';



@Injectable(as: BannersRepo)
class BannersRepoImpl implements BannersRepo {
  final BannersDataSource bannersDataSource;

  BannersRepoImpl(this.bannersDataSource);

  @override
  Future<Result<BannersEntity?>> fetchBannersData() {
    return bannersDataSource.fetchBannersData();
  }
}
