import '../../data/models/store_info_responce.dart';

class StoreInfoEntity {
  final String? status;

  final Store? store;

  StoreInfoEntity({
    this.status,
    this.store,
  });
}

class StoreInfoEditEntity {
  final String? message;

  StoreInfoEditEntity({
    this.message,
  });
}

class UploadImageStoreEntity {
  final String? status;
  final String? message;

  UploadImageStoreEntity ({
    this.status,
    this.message,
  });


}