import 'package:flutter/material.dart';
import '../model/category.dart';

class ChildCategory with ChangeNotifier {
  List<BxMallSubDto> childCategoryList = [];
  int childIndex = 0;
  String categoryId = '4';
  String subId = '';

  getChildCategory(List list) {
    childCategoryList = list;
    // subId = index;
    notifyListeners();
  }

  changeChildIndex(index) {
    childIndex = index;
    notifyListeners();
  }
}
