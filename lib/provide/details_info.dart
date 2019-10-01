import 'package:flutter/material.dart';
import '../model/details.dart';
import '../service/service_method.dart';
import 'dart:convert';

class DetailsInfoProvide with ChangeNotifier {
  DetailsModel goodsInfo = null;
  bool isLeft = true;
  bool isRight = false;

  getGoodsInfo(String id) async {
    var data = {'goodId': id};

    await request('getGoodDetailById', data: data).then((res) {
      var responseData = json.decode(res.toString());

      goodsInfo = DetailsModel.fromJson(responseData);
      notifyListeners();
    });
  }

  changeItem(String LoR){
    if(LoR == 'left'){
      isLeft = true;
      isRight = true;
    }else{
      isLeft = false;
      isRight = true;
    }
  }
}
