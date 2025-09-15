import 'package:flutter/material.dart';
import 'package:fruit_hub/core/widgets/build_app_bar.dart';

class ProductsView extends StatelessWidget {
  const ProductsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, isLeadingVisible: false, title: 'المنتجات'),
      body: Center(child: Text('Products View')),
    );
  }
}
