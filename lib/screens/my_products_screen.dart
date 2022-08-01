import 'package:flutter/material.dart';
import 'package:not_own_code/widgets/app_drawer.dart';
import 'package:not_own_code/widgets/edit_products.dart';
import 'package:provider/provider.dart';
import '../providers/products.dart';
import '../widgets/my_product_item.dart';

class MyProducts extends StatelessWidget {
 
  static const routeName = '/my_products';

  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<Products>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("YOur Products"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(EditProducts.routeName);
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      drawer: AppDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: productData.items.length,
          itemBuilder: (context, index) => Column(
            children: [
              MyProductItem(
                  productData.items[index].title, 
                  productData.items[index].imageUrl,
                  productData.items[index].id,
                  ),
                  Divider(),
            ],
          ),
              
        ),
      ),
    );
  }
}
