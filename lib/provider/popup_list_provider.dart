import 'package:flutter/cupertino.dart';
import 'dart:ui' as ui;

import 'package:flutter/services.dart';

class PopUpListProvider extends ChangeNotifier {
  heightMQ(context) {
    double height = MediaQuery.of(context).size.height;
    return height;
  }

  widthMQ(context) {
    double width = MediaQuery.of(context).size.width;
    return width;
  }

  selectedCategory0(){
    if (isSelected == 0) {
      isSelected = 1;
    } else {
      isSelected = 0;
    }
    notifyListeners();
  }
  selectedCategory1(){
    if (isSelected == 1) {
      isSelected = 2;
    } else {
      isSelected = 1;
    }
    notifyListeners();
  }
  selectedCategory2(){
    if (isSelected == 2) {
      isSelected = 0;
    } else {
      isSelected = 2;
    }
    notifyListeners();
  }


  List categoryList = [
    {
      "icon": "assets/svg/cleaningIcon.svg",
      "isCheck": false,
      "title": "Cleaning",
    },
    {
      "icon": "assets/svg/ac.svg",
      "isCheck": false,
      "title": "Ac repair",
    },
    {
      "icon": "assets/svg/carpenter.svg",
      "isCheck": false,
      "title": "Carpenter",
    },
    {
      "icon": "assets/svg/cooking.svg",
      "isCheck": false,
      "title": "Cooking",
    },
    {
      "icon": "assets/svg/electric.svg",
      "isCheck": false,
      "title": "Electric",
    },
    {
      "icon": "assets/svg/painter.svg",
      "isCheck": false,
      "title": "Painter",
    },
    {
      "icon": "assets/svg/plumber.svg",
      "isCheck": false,
      "title": "Plumber",
    },
  ];

  List ratingList = [
    {
      "rate": "5 rate",
      "isRated": false,
      "icon": "assets/svg/star5.svg",
    },
    {
      "rate": "4 rate",
      "isRated": false,
      "icon": "assets/svg/star4.svg",
    },
    {
      "rate": "3 rate",
      "isRated": false,
      "icon": "assets/svg/star3.svg",
    },
    {
      "rate": "2 rate",
      "isRated": false,
      "icon": "assets/svg/star2.svg",
    },
    {
      "rate": "1 rate",
      "isRated": false,
      "icon": "assets/svg/star1.svg",
    },
  ];

  slidingValue(newValue){
    slider = newValue;
    notifyListeners();
  }

  int isSelected = 0;
  bool isSelect = false;

  onCategoryListCheck(index) {
    categoryList[index]['isCheck'] = !categoryList[index]['isCheck'];
    notifyListeners();
  }

  onPriceListCheck(index) {
    ratingList[index]['isRated'] = !ratingList[index]['isRated'];
    notifyListeners();
  }

  onChange() {
    isSelect = false;
    notifyListeners();
  }

  onChange1() {
    isSelect = true;
    notifyListeners();
  }

  double sliderValue = 0.0;

  onChangeSlider(sVal) {
    notifyListeners();
    sliderValue = sVal;
    notifyListeners();
  }

  Future<ui.Image>? loadingImage;

  double slider = 0.00;

  Future<ui.FrameInfo> loadImage(String assetPath) async {
    ByteData data = await rootBundle.load(assetPath);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List());
    ui.FrameInfo fi = await codec.getNextFrame();
    notifyListeners();
    return fi;
  }
  ui.Image? customImage;
}
