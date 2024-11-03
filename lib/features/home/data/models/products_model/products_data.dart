// ignore_for_file: overridden_fields

import 'package:selaty/core/constants/constants.dart';
import 'package:selaty/features/home/domain/entities/product_entity.dart';

class ProductsData extends ProductEntity {
  @override
  int? id;
  int? userId;
  int? type;
  int? ord;
  String? isUsed;
  int? categoryId;
  int? countryId;
  int? brandId;
  @override
  String? name;
  String? nameEn;
  @override
  String? details;
  String? detailsEn;
  int? colorId;
  String? tag;
  String? tagEn;
  dynamic taxId;
  @override
  String? price;
  int? discount;
  dynamic sku;
  @override
  int? quantity;
  int? notifiQuantity;
  int? stokeId;
  dynamic repositoryNumber;
  String? img;
  String? productCode;
  dynamic hashNumber;
  dynamic barcode;
  String? barcodeNumber;
  int? weight;
  dynamic numViews;
  String? isActive;
  dynamic deletedAt;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic userIp;
  dynamic userPcInfo;
  dynamic userAdded;
  int? priceAfterDiscount;
  @override
  int? isFavorite;

  ProductsData({
    this.id,
    this.userId,
    this.type,
    this.ord,
    this.isUsed,
    this.categoryId,
    this.countryId,
    this.brandId,
    this.name,
    this.nameEn,
    this.details,
    this.detailsEn,
    this.colorId,
    this.tag,
    this.tagEn,
    this.taxId,
    this.price,
    this.discount,
    this.sku,
    this.quantity,
    this.notifiQuantity,
    this.stokeId,
    this.repositoryNumber,
    this.img,
    this.productCode,
    this.hashNumber,
    this.barcode,
    this.barcodeNumber,
    this.weight,
    this.numViews,
    this.isActive,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
    this.userIp,
    this.userPcInfo,
    this.userAdded,
    this.priceAfterDiscount,
    this.isFavorite,
  }) : super(
          id: id ?? 0,
          name: name ?? 'no name',
          details: details ?? 'no details',
          price: price ?? 'no price',
          image: "$kBaseUrlForImage${img ?? '30.jpg'}",
          isFavorite: isFavorite ?? 0,
          quantity: quantity ?? 0,
        );

  factory ProductsData.fromJson(Map<String, dynamic> json) => ProductsData(
        id: json['id'] as int?,
        userId: json['user_id'] as int?,
        type: json['type'] as int?,
        ord: json['ord'] as int?,
        isUsed: json['is_used'] as String?,
        categoryId: json['category_id'] as int?,
        countryId: json['country_id'] as int?,
        brandId: json['brand_id'] as int?,
        name: json['name'] as String?,
        nameEn: json['name_en'] as String?,
        details: json['details'] as String?,
        detailsEn: json['details_en'] as String?,
        colorId: json['color_id'] as int?,
        tag: json['tag'] as String?,
        tagEn: json['tag_en'] as String?,
        taxId: json['tax_id'] as dynamic,
        price: json['price'] as String?,
        discount: json['discount'] as int?,
        sku: json['sku'] as dynamic,
        quantity: json['quantity'] as int?,
        notifiQuantity: json['notifi_quantity'] as int?,
        stokeId: json['stoke_id'] as int?,
        repositoryNumber: json['repository_number'] as dynamic,
        img: json['img'] as String?,
        productCode: json['product_code'] as String?,
        hashNumber: json['hash_number'] as dynamic,
        barcode: json['barcode'] as dynamic,
        barcodeNumber: json['barcode_number'] as String?,
        weight: json['weight'] as int?,
        numViews: json['num_views'] as dynamic,
        isActive: json['is_active'] as String?,
        deletedAt: json['deleted_at'] as dynamic,
        createdAt: json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at'] as String),
        updatedAt: json['updated_at'] == null
            ? null
            : DateTime.parse(json['updated_at'] as String),
        userIp: json['user_ip'] as dynamic,
        userPcInfo: json['user_pc_info'] as dynamic,
        userAdded: json['user_added'] as dynamic,
        priceAfterDiscount: json['price_after_discount'] as int?,
        isFavorite: json['is_favorite'] as int?,
      );
}
