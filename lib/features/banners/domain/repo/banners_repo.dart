

import 'dart:io';

import 'package:dashboard_market/core/common/api_result.dart';
import 'package:dashboard_market/features/banners/domain/entities/banners_entity.dart';

abstract class BannersRepo {
  Future<Result<BannersEntity?>>fetchBannersData();
  Future<Result<AddBannersEntity?>>addBanners(String? title,
      String? description, int? productId, File imagePath, int? status);
  Future<Result<DeleteBannerEntity?>> deleteBanner(int? bannerId ,String? imagePath);
  Future<Result<ChangeStatusEntity?>> changeStatus(int? bannerId ,int? status);
}