import 'package:contactbook/screen/app_screen/product_list_screen/layouts/filter_layout.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:contactbook/extensions/widget_extension.dart';
import 'package:contactbook/provider/onboarding_provider/stateful_wrapper.dart';
import 'package:contactbook/provider/product_list_provider/product_list_provider.dart';
import 'package:contactbook/screen/app_screen/product_list_screen/product_array_model.dart';
import 'package:contactbook/screen/app_screen/product_list_screen/layouts/product_grid_layout.dart';
import 'package:contactbook/screen/app_screen/product_list_screen/layouts/common_gridview_layout.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ProductListProvider>(
        builder: (context, productListPvr, child) {
      return StatefulWrapper(
          onInit: () => Future.delayed(const Duration(milliseconds: 100),
              () => productListPvr.removeDuplicateBySize(productArrayList)),
          child: Scaffold(
              appBar: AppBar(backgroundColor: Colors.blue.shade200, actions: [
                IconButton(
                    onPressed: () {
                      showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return const FilterLayout();
                          });
                    },
                    icon: const Icon(Icons.filter_alt_outlined))
              ]),
              body: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                        child: CommonGridView(
                            itemCount:
                                productListPvr.selectedProducts.isNotEmpty
                                    ? productListPvr.selectedProducts.length
                                    : productArrayList.length,
                            itemBuilder: (context, index) {
                              return productListPvr.selectedProducts.isNotEmpty
                                  ? ProductGrid(
                                      productListPvr.selectedProducts[index])
                                  : ProductGrid(productArrayList[index]);
                            }))
                  ]).padding(all: 20)));
    });
  }
}
