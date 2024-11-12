// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_user_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************
class AllCartUserModelAdapter extends TypeAdapter<AllCartUserModel> {
  @override
  final int typeId = 0;

  @override
  AllCartUserModel read(BinaryReader reader) {
    return AllCartUserModel(
      cartUsers: (reader.read() as List)
          .cast<CartUserModel>(), // Ensure cast to List<CartUserModel>
    );
  }

  @override
  void write(BinaryWriter writer, AllCartUserModel obj) {
    writer.write(obj.cartUsers);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AllCartUserModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class CartUserModelAdapter extends TypeAdapter<CartUserModel> {
  @override
  final int typeId = 1;

  @override
  CartUserModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CartUserModel(
      tonken: fields[0] as String?,
      productCart: (fields[1] as List?)?.cast<ProductCart>(),
      totalPrice: fields[2] as double?,
      totalQuantity: fields[3] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, CartUserModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.tonken)
      ..writeByte(1)
      ..write(obj.productCart)
      ..writeByte(2)
      ..write(obj.totalPrice)
      ..writeByte(3)
      ..write(obj.totalQuantity);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CartUserModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ProductCartAdapter extends TypeAdapter<ProductCart> {
  @override
  final int typeId = 2;

  @override
  ProductCart read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProductCart(
      id: fields[0] as int?,
      name: fields[1] as String?,
      details: fields[2] as String?,
      price: fields[3] as double?,
      image: fields[4] as String?,
      isFavorite: fields[5] as int?,
      quantity: fields[6] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, ProductCart obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.details)
      ..writeByte(3)
      ..write(obj.price)
      ..writeByte(4)
      ..write(obj.image)
      ..writeByte(5)
      ..write(obj.isFavorite)
      ..writeByte(6)
      ..write(obj.quantity);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductCartAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
