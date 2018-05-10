import 'package:flutter/material.dart';
import 'model/product.dart';
import 'model/data.dart';
import 'supplemental/asymmetric_view.dart';

class HomePage extends StatelessWidget {
  final Category category;

  const HomePage({Key key, this.category: Category.all}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AsymmetricView(products: getProducts(category)),
    );
  }
}
