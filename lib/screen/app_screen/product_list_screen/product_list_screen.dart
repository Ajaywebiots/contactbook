import 'package:contactbook/config.dart';
import 'package:contactbook/extensions/widget_extension.dart';
import 'package:contactbook/screen/app_screen/product_list_screen/filter_bottom_sheet.dart';
import 'package:flutter/material.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(actions: [
          IconButton(
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return const FilterBottomSheet();
                    });
              },
              icon: const Icon(Icons.filter_alt_outlined))
        ]),
        body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Expanded(
              child: GridView.builder(
                  itemCount: productModel.productArrayList.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemBuilder: (context, index) {
                    return Card(
                        elevation: 5,
                        child:
                            Column(mainAxisSize: MainAxisSize.max, children: [
                          Card(
                              elevation: 5,
                              child: Image.network(
                                  productModel.productArrayList[index]
                                      ['imageUrl'][0],
                                  height: 140,
                                  width: 140)),
                          Text(productModel.productArrayList[index]['name'],
                                  overflow: TextOverflow.ellipsis)
                              .padding(all: 5),
                          Text(
                              '${productModel.productArrayList[index]['price']}')
                        ]));
                  }))
        ]));
  }
}
