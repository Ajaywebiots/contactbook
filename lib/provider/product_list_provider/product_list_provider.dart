import 'dart:developer';
import 'package:contactbook/screen/app_screen/product_list_screen/layouts/modelclass.dart';
import 'package:contactbook/screen/app_screen/product_list_screen/product_array_model.dart';
import 'package:flutter/material.dart';

class ProductListProvider extends ChangeNotifier {
  double maxPrice = 0;
  List priceList = [];
  bool listView = false;
  List selectedSize = [];
  double minPrice = 0.00;
  List selectedColor = [];
  List allFilterProduct = [];
  List sizeList = [], colorList = [];
  List ll = ["Price", "Color", "Size"];
  RangeValues currentRangeValues = const RangeValues(0, 100);

  onSliderChange(val) {
    currentRangeValues = val;
    notifyListeners();
  }

  void filterProductsByColor() {
    log("selectedColor : $selectedColor");
    for (var color in selectedColor) {
      for (Product product in productArrayList) {
        if (product.color.contains(color)) {
          if (!selectedProducts.contains(product)) {
            selectedProducts.add(product);
          }
        }
      }
    }
    notifyListeners();
  }

  void filterProductsBySize() {
    log("selectedColor : $selectedColor");
    for (var color in selectedSize) {
      for (Product product in productArrayList) {
        if (product.size.contains(color)) {
          if (!selectedProducts.contains(product)) {
            selectedProducts.add(product);
          }
        }
      }
    }
    notifyListeners();
  }

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

  void updateSelectedProducts() {
    selectedProducts.clear();

    for (Product product in productArrayList) {
      final priceInRange = product.price >= minPrice && product.price <= maxPrice;
      final colorMatch = selectedColor.isEmpty || selectedColor.contains(product.color);
      final sizeMatch = selectedSize.isEmpty || selectedSize.contains(product.size);

      if (priceInRange && colorMatch && sizeMatch) {
        selectedProducts.add(product);
        log("selectedProducts$selectedProducts");
      }
    }

    notifyListeners();
  }

  // void updateSelectedProducts() {
  //   log("RANGE : $minPrice // $maxPrice");
  //   for (Product product in productArrayList) {
  //     log("RANGE : ${product.price >= minPrice && product.price <= maxPrice}");
  //     log("RANGE : ${product.price}");
  //     if (product.price >= minPrice && product.price <= maxPrice) {
  //       if (!selectedProducts.contains(product)) {
  //         selectedProducts.add(product);
  //       }
  //       // log("selectedProducts:::::::::::::::$selectedProducts");
  //     }
  //   }
  //   notifyListeners();
  // }


  onApplyChange(context){
    selectedProducts = [];
    minPrice = currentRangeValues.start;
    maxPrice = currentRangeValues.end;
    filterProductsBySize();
    updateSelectedProducts();
    filterProductsByColor();
    Navigator.pop(context);
  }

  onClearAll(context){
    selectedProducts = [];
    minPrice = currentRangeValues.start;
    maxPrice = currentRangeValues.end;
    selectedColor = [];
    selectedSize = [];
    updateSelectedProducts();
    Navigator.pop(context);

    //   setState(() {
    //     productListPvr
    //         .selectedProducts = [];
    //     productListPvr.selectedColor =
    //         [];
    //     productListPvr.selectedSize =
    //         [];
    //     productListPvr
    //         .removeDuplicateBySize(
    //             productArrayList);
    //   });
    // }
  }

  onLoopChange() {
    for (Product product in productArrayList) {
      if (product.price > maxPrice) {
        maxPrice = product.price.toDouble();
        log("maxPrice:::::::$maxPrice");
      }
    }
    RangeValues newRangeValue = RangeValues(0, maxPrice);
    onSliderChange(newRangeValue);
  }

  bool isSelectedAllColor = false;
  List<Product> selectedProducts = [];
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

  onSizeSelected(data) {
    if (!selectedSize.contains(data)) {
      selectedSize.add(data);
    } else {
      selectedSize.remove(data);
    }
    notifyListeners();
  }

  selectAllSize() {
    isSelectedAllSize = !isSelectedAllSize;
    if (isSelectedAllSize == true) {
      for (var data in sizeList) {
        if (!selectedSize.contains(data)) {
          selectedSize.add(data);
          log("selectedSize$selectedSize");
        }
      }
    } else {
      selectedSize = [];
    }
    notifyListeners();
  }

  onColorSelected(data) {
    if (!selectedColor.contains(data)) {
      selectedColor.add(data);
    } else {
      selectedColor.remove(data);
    }
    notifyListeners();
  }

  selectAllColor() {
    isSelectedAllColor = !isSelectedAllColor;
    if (isSelectedAllColor == true) {
      for (var data in colorList) {
        if (!selectedColor.contains(data)) {
          selectedColor.add(data);
          log("selectedColor$selectedColor");
        }
      }
    } else {
      selectedColor = [];
    }
    notifyListeners();
  }
}
