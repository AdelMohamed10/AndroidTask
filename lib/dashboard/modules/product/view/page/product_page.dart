import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled1/dashboard/modules/product/controller/product_cubit.dart';
import 'package:untitled1/dashboard/modules/product/model/entity_model/product_model.dart';

import '../component/product_item_widget.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => ProductCubit(),
      child: BlocBuilder<ProductCubit, ProductState>(
        builder: (context, state) {
          final ProductCubit controller = context.read<ProductCubit>();
            return Scaffold(
              body: state is ProductStateLoading?
                const CircularProgressIndicator():
                state is ProductStateEmpty?
                const Icon(CupertinoIcons.delete):
                  ListView.builder(
                    itemBuilder: (_, int index) => ProductItemWidget(productModel: controller.products[index],
            ),
                itemCount: controller.products.length,
              ),
            );
        },
      ),
    );
  }
}