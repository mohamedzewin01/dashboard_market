import 'package:dashboard_market/features/banners/data/models/response/AddBannerModel.dart';
import 'package:dashboard_market/features/banners/data/models/response/banners_models_response.dart';

import '../../data/models/response/delete_banner_model.dart';

class BannersEntity {
  BannersEntity({
      this.status, 
      this.banners,});


  String? status;
  List<Banners>? banners;



}

class AddBannersEntity {
  AddBannersEntity({
    this.status,
    this.newBanner,});


  String? status;
  NewBanner? newBanner;


}

class DeleteBannerEntity {
  DeleteBannerEntity({
    this.status,
    this.deletedData,});


  String? status;
  DeletedData? deletedData;

}

class ChangeStatusEntity {
  ChangeStatusEntity({
    this.message,});
  String? message;
}