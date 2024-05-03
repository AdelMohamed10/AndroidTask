import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:untitled1/dashboard/modules/product/model/entity_model/product_model.dart';
import 'package:untitled1/dashboard/modules/product/model/repo/database_repo.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductStateLoading()) {
    init();
  }

  List<ProductModel> products = [];

  DatabaseRepo repo = DatabaseRepo();

  Future<void> init() async {
    emit(ProductStateLoading());
    await repo.initDB();
    await repo.insertProduct('product1', 'desc', 0, 10, Uint8List(10));
    await repo.insertProduct('product2', 'desc2', 0, 20, Uint8List(10));
    products = await repo.fetchProducts();
    if (products.isEmpty) {
      emit(ProductStateEmpty());
    }else {
      emit(ProductStateLoaded());
    }
  }

}