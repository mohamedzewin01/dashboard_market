import 'package:dashboard_market/features/banners/data/models/response/AddBannerModel.dart';
import 'package:dashboard_market/features/banners/data/models/response/banners_models_response.dart';

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