import 'dart:io';

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

  @override
  Future<Result<AddBannersEntity?>> addBanners(String? title,
      String? description, int? productId, File imagePath, int? status) {
    return bannersDataSource.addBanner(
        title, description, productId, imagePath, status);
  }

  @override
  Future<Result<DeleteBannerEntity?>> deleteBanner(int? bannerId, String? imagePath) {
    return bannersDataSource.deleteBanner(bannerId, imagePath);
  }

  @override
  Future<Result<ChangeStatusEntity?>> changeStatus(int? bannerId, int? status) {
    return bannersDataSource.changeStatus(bannerId, status);
  }
}
