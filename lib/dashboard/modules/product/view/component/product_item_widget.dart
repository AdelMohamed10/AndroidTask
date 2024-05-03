import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled1/dashboard/modules/product/model/entity_model/product_model.dart';

class ProductItemWidget extends StatelessWidget {
  const ProductItemWidget({Key? key, required ProductModel productModel})
      : productModel = productModel,
        super(key: key);
  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.grey,
          border: Border.all(color: Colors.black, width: 2),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(productModel.name ?? 'product'),
                Text(productModel.desc ?? 'description'),
              ],
            ),
            Spacer(),
            Column(
              children: <Widget>[
                Text((productModel.availableQuantity ?? 0).toString()),
                InkWell(
                  onTap: () {
                    log('add to favorite');
                  },
                  child: productModel.favorite == 1
                      ? const Icon(
                    CupertinoIcons.heart,
                    color: Colors.red,
                  )
                      : const Icon(
                    CupertinoIcons.heart,
                    // You can choose a different icon here
                    color: Colors.grey,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
