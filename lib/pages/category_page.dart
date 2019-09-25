import 'dart:convert';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provide/provide.dart';

import '../model/category.dart';
import '../provide/child_category.dart';
import 'package:flutter/material.dart';
import 'package:project1/service/service_method.dart';

class CategoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('数据分类'),
      ),
      body: Container(
          // width: ScreenUtil().setWidth(1000),
          child: Row(
        children: <Widget>[
          LeftNavigationNav(),
          Column(
            children: <Widget>[
              RightNavigationNav(),
            ],
          )
        ],
      )),
    );
  }
}

class LeftNavigationNav extends StatefulWidget {
  @override
  _LeftNavigationNavState createState() => _LeftNavigationNavState();
}

class _LeftNavigationNavState extends State<LeftNavigationNav> {
  List list = [];
  var listindex = 0;

  @override
  void initState() {
    _getLeftData();
    super.initState();
  }

  void _getLeftData() async {
    await request('getCategory').then((res) {
      var data = json.decode(res.toString());
      CategoryBigListModel category = CategoryBigListModel.fromJson(data);
      setState(() {
        list = category.data;
      });
    });
  }

  Widget _LeftInkWell(int index) {
    bool isClick = false;
    isClick=(index==listindex)?true:false;
    return InkWell(
      onTap: () {
        setState(() {
          listindex = index;
        });

        var childlist = list[index].bxMallSubDto;

        Provide.value<ChildCategory>(context).getChildCategory(childlist);
      },
      child: Container(
        padding: EdgeInsets.only(left: 15, top: 20),
        height: ScreenUtil().setHeight(80),
        decoration: BoxDecoration(
            color: isClick?Colors.black12:Colors.white,
            border: Border(
                bottom: BorderSide(width: 1, color: Colors.black12),
                right: BorderSide(width: 1, color: Colors.black12))),
        child: Text(list[index].mallCategoryName),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // print(list);
    return Container(
      width: ScreenUtil().setWidth(200),
      child: ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) {
          return _LeftInkWell(index);
        },
      ),
    );
  }
}

class RightNavigationNav extends StatefulWidget {
  @override
  _RightNavigationNavState createState() => _RightNavigationNavState();
}

class _RightNavigationNavState extends State<RightNavigationNav> {
  List list = ['一级', '二级', '三级', '四级', '五级', '六级', '七级'];

  Widget _rightInkWell(BxMallSubDto item) {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 10.0),
        decoration: BoxDecoration(
            border: Border(right: BorderSide(color: Colors.black12, width: 1))),
        child: Text(
          item.mallSubName,
          style: TextStyle(fontSize: ScreenUtil().setSp(28)),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(child: Provide<ChildCategory>(
      builder: (context, child, childCategory) {
        return Container(
          height: ScreenUtil().setHeight(80),
          width: ScreenUtil().setWidth(550), //必须设置 宽高
          child: Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Colors.black12, width: 1),
                  // right: BorderSide(width: 20, color: Colors.black12)
                ),
              ),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: childCategory.childCategoryList.length,
                itemBuilder: (context, index) {
                  //动态的因此采用  listview
                  // return InkWell(
                  // onTap: () {},
                  // child: Container(
                  //   decoration: BoxDecoration(
                  //       border: Border(
                  //           right:
                  //               BorderSide(color: Colors.black12, width: 1))),
                  //   padding: EdgeInsets.only(left: 5, right: 5, top: 15, bottom: 5),
                  //   child: Text(
                  //     childCategory.childCategoryList[index],
                  //     style: TextStyle(fontSize: ScreenUtil().setSp(28)),
                  //   ),
                  // ),
                  // );
                  return _rightInkWell(childCategory.childCategoryList[index]);
                },
              )),
        );
      },
    ));
  }
}
