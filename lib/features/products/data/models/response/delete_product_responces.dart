import '../../../domain/entities/products_entities.dart';

class DeleteProductResponses {
  String? status;
  String? message;
  int? deletedRows;

  DeleteProductResponses({this.status, this.message, this.deletedRows});

  DeleteProductResponses.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    deletedRows = json['deleted_rows'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    data['deleted_rows'] = deletedRows;
    return data;
  }

  DeleteProductEntity toDeleteProductEntity() => DeleteProductEntity(
       message: message,);
}
