import 'dart:developer';

import 'package:contactbook/screen/app_screen/product_list_screen/layouts/modelclass.dart';
import 'package:contactbook/screen/app_screen/product_list_screen/product_array_model.dart';
import 'package:flutter/material.dart';

class ProductListProvider extends ChangeNotifier {
  double maxPrice = 0;

  List<String> selectedSize = [];
  List sizeList = [], colorList = [];
  List priceList = [];

  List colorSortList = [];
  List sizeSortList = [];


  bool listView = false;

  List ll = ["Price", "Color", "Size"];

  RangeValues currentRangeValues = const RangeValues(0, 100);
  removeDuplicateBySize(List<Product> productList) {
    notifyListeners();
    for (var product in productList) {
      List sizeKey = product.size;
      List colorKey = product.color;
      log("colorList :: ${product.color}");
      sizeKey.asMap().entries.forEach((element) {
        if (!sizeList.contains(element.value)) {
          sizeList.add(element.value);
        }
      });
      colorKey.asMap().entries.forEach((element) {
        if (!colorList.contains(element.value)) {
          colorList.add(element.value);
        }
      });
    }
    notifyListeners();
    log("sizeList :: $sizeList");
    log("colorList :: $colorList");
    onLoopChange();
    notifyListeners();
  }

  onLoopChange() {
    for (Product product in productArrayList) {
      if (product.price > maxPrice) {
        maxPrice = product.price.toDouble();
        log("maxPrice:::::::$maxPrice");
      }
    }

  }

  bool isSelectedAllColor = false;
  bool isSelectedAllSize = false;



  int isSelected = 0;

  onPriceTap() {
    if (isSelected == 0) {
      isSelected = 1;
      notifyListeners();
    } else {
      isSelected = 0;
      notifyListeners();
    }
  }

  onColorTap() {
    if (isSelected == 1) {
      isSelected = 2;
      notifyListeners();
    } else {
      isSelected = 1;
      notifyListeners();
    }
  }

  onSizeTap() {
    if (isSelected == 2) {
      isSelected = 0;
      notifyListeners();
    } else {
      isSelected = 2;
      notifyListeners();
    }
  }

  onColorSelected(index) {
    productArrayList[index].isColorSelected =
        !productArrayList[index].isColorSelected;
    notifyListeners();
  }

  onSizeSelected(index) {
    productArrayList[index].isSizeSelected =
        !productArrayList[index].isSizeSelected;
    notifyListeners();
  }
}
