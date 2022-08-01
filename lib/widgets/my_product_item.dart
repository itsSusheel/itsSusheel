import 'package:flutter/material.dart';

import './edit_products.dart';
import 'package:provider/provider.dart';
import '../providers/products.dart';

class MyProductItem extends StatelessWidget {
  final String title;
  final String imageURL;
  final String? id;

  MyProductItem(this.title, this.imageURL, this.id);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      leading : CircleAvatar(
        backgroundImage: NetworkImage(imageURL),
      ),
      
      trailing: Container(
        width: 100,
        child: Row(children: [
          IconButton(
            onPressed: () {
               Navigator.of(context).pushNamed(EditProducts.routeName,arguments: id);
            },
            icon: const Icon(Icons.edit),
          ),
          IconButton(
            onPressed: () {
             Provider.of<Products>(context, listen: false).deleteProduct(id.toString());
            },
            icon: const Icon(
              Icons.delete,
              color: Colors.red,
            ),
          )
        ]),
      ),
    );
  }
}
