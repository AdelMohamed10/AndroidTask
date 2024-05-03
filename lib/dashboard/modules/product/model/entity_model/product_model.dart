import 'dart:typed_data';

class ProductModel {
  String? name, desc;
  int? favorite, cart, id, quantity, availableQuantity;
  Uint8List? image;

  ProductModel.fromJson(Map m) {
    name = m['name'];
    desc = m['description'];
    image = m['image'];
    quantity = m['quantity'];
    availableQuantity = m['availableQuantity'];
    cart = m['cart'];
    favorite = m['favorite'];
    id = m['id'];
  }

}