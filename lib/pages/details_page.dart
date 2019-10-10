import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project1/pages/details_page/tabbar.dart' as prefix0;
import '../provide/details_info.dart';
import 'package:provide/provide.dart';
import './details_page/top.dart';
import './details_page/expalin.dart';
import './details_page/detail_stack.dart';
import './details_page/hmtl.dart';


class DetailsPage extends StatelessWidget {
  final String goodsId;
  DetailsPage(this.goodsId);

  Future _getBackInfo(BuildContext context) async {
    await Provide.value<DetailsInfoProvide>(context).getGoodsInfo(goodsId);
    return 'future 状态';
  }

  @override
  Widget build(BuildContext context) {
    // _getBackInfo(context);
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              print('返回上一页');
              Navigator.pop(context);
            },
          ),
          title: Text('商品详细页'),
        ),
        body: FutureBuilder(
          future: _getBackInfo(context),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Stack(
                children: <Widget>[
                  ListView(
                    children: <Widget>[
                      DetailsTopView(),
                      ExpalinView(),
                      prefix0.TabBarView(),
                      DetailsHtmlView(),
                    ],
                  ),
                  Positioned(
                    left: 0,
                    bottom: 0,
                    child:StackBottom(),
                    )
                ],
              );
            } else {
              return Container(
                alignment: Alignment.center,
                width: ScreenUtil().setWidth(750),
                child: Text('暂无数据'),
              );
            }
          },
        ));
  }
}
