import 'dart:convert';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../model/category.dart';
import 'package:flutter/material.dart';
import 'package:project1/service/service_method.dart';


class CategoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text('数据分类'),),
      body: Container(
        // width: ScreenUtil().setWidth(1000),
        child: Row(
          children: <Widget>[
            LeftNavigationNav(),
          ],
        )
        ),
      );
  }
}


class LeftNavigationNav extends StatefulWidget {
  @override
  _LeftNavigationNavState createState() => _LeftNavigationNavState();
}

class _LeftNavigationNavState extends State<LeftNavigationNav> {
  List list = [];

  @override
  void initState() {
    _getLeftData();
    super.initState();
  }

  void _getLeftData() async{
    await request('getCategory').then((res){
      var data = json.decode(res.toString());
      CategoryBigListModel category = CategoryBigListModel.fromJson(data);
      setState(() {
        list = category.data;
      });
    });
  } 

  Widget _LeftInkWell(int index){
    return InkWell(
      onTap: (){},
      child: Container(
        padding: EdgeInsets.only(left: 15, top: 20),
        height: ScreenUtil().setHeight(80),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
              bottom: BorderSide(
                width: 1,
                color: Colors.black12
              ),
              right: BorderSide(width: 1,color: Colors.black12)
          )
        ),
        child: Text(list[index].mallCategoryName),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    print(list);
    return Container(
      width: ScreenUtil().setWidth(200),
      child: ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index){
          return _LeftInkWell(index);
        },
      ),
    );
  }
}