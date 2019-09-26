import 'dart:convert';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provide/provide.dart';

import '../model/category.dart';
import '../provide/child_category.dart';
import 'package:flutter/material.dart';
import 'package:project1/service/service_method.dart';
import '../model/categoryGoodsList.dart';
import '../provide/category_goods_list.dart';

class CategoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('商品分类'),
      ),
      body: Container(
          // width: ScreenUtil().setWidth(1000),
          child: Row(
        children: <Widget>[
          LeftNavigationNav(),
          Column(
            children: <Widget>[RightNavigationNav(), RightGoodsList()],
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

  void _getGoodsList({String categoryId}) async {
    var data = {
      'categoryId': categoryId == null ? '4' : categoryId,
      'categorySubId': "",
      'page': 1
    };
    await request('getMallGoods', data: data).then((val) {
      var data = json.decode(val.toString());
      CategoryGoodsListModel goodsList = CategoryGoodsListModel.fromJson(data);

      Provide.value<CategoryGoodsListProvide>(context)
          .getGoodsList(goodsList.data);

      // setState(() {
      //   list = goodsList.data;
      // });
      // print('分类商品列表：>>>>>>>>>>>>>${data}');
    });
  }

  Widget _LeftInkWell(int index) {
    bool isClick = false;
    isClick = (index == listindex) ? true : false;
    return InkWell(
      onTap: () {
        setState(() {
          listindex = index;
        });

        var childlist = list[index].bxMallSubDto;
        var categoryId = list[index].mallCategoryId;

        Provide.value<ChildCategory>(context).getChildCategory(childlist);
        _getGoodsList(categoryId: categoryId);
      },
      child: Container(
        padding: EdgeInsets.only(left: 15, top: 20),
        height: ScreenUtil().setHeight(80),
        decoration: BoxDecoration(
            color: isClick ? Colors.black12 : Colors.white,
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

class RightGoodsList extends StatefulWidget {
  @override
  _RightGoodsListState createState() => _RightGoodsListState();
}

class _RightGoodsListState extends State<RightGoodsList> {
  List list = [];

  @override
  void initState() {
    // _getGoodList();
    super.initState();
  }

  //图片部分
  Widget _goodsImage(List list, int index) {
    return Container(
      width: ScreenUtil().setWidth(270),
      child: Image.network(list[index].image),
    );
  }

  Widget _goodsName(List list, int index) {
    return Container(
      // padding: EdgeInsets.only(top: 5),

      height: ScreenUtil().setHeight(25),
      width: ScreenUtil().setWidth(250),
      child: Text(
        list[index].goodsName,
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: ScreenUtil().setSp(25)),
      ),
    );
  }

  Widget _goodsPrice(List list, int index) {
    return Container(
      width: ScreenUtil().setWidth(250),
      padding: EdgeInsets.only(top: 3),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            '￥${list[index].presentPrice}',
            style:
                TextStyle(fontSize: ScreenUtil().setSp(28), color: Colors.red),
          ),
          Text(
            '￥${list[index].oriPrice}',
            style: TextStyle(
                color: Colors.black12,
                fontSize: ScreenUtil().setSp(25),
                decoration: TextDecoration.lineThrough, //下划线效果
                decorationColor: Colors.black12),
          )
        ],
      ),
    );
  }

  Widget _ConstWidget(List list, int index) {
    var listlength = list.length;

    if (listlength > 0 && listlength > index + 1) {
      return Container(
        width: ScreenUtil().setWidth(570),
        // padding: EdgeInsets.all(5),
        child: Row(
          children: <Widget>[
            Column(
              children: <Widget>[
                _goodsImage(list, index),
                _goodsName(list, index),
                _goodsPrice(list, index)
              ],
            ),
            Column(
              children: <Widget>[
                _goodsImage(list, index + 1),
                _goodsName(list, index + 1),
                _goodsPrice(list, index + 1)
              ],
            )
          ],
        ),
      );
    } else {
      return Text(
        '再往下滑就没数据啦',
        textAlign: TextAlign.center,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Provide<CategoryGoodsListProvide>(
      builder: (context, child, data) {
        return Container(
          // padding: EdgeInsets.all(5.0),
          width: ScreenUtil().setWidth(550),
          height: ScreenUtil().setHeight(1000),
          child: ListView.builder(
            itemCount: data.goodsList.length,
            itemBuilder: (context, index) {
              return _ConstWidget(data.goodsList,index);
            },
          ),
        );
      },
    );
  }
}
