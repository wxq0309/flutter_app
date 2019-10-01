import 'package:flutter/material.dart';
import '../../provide/details_info.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provide/provide.dart';

class DetailsTopView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provide<DetailsInfoProvide>(builder: (context, child, res) {
      var detailsInfo =
          Provide.value<DetailsInfoProvide>(context).goodsInfo.data.goodInfo;
      if (detailsInfo != null) {
        return Container(
          color: Colors.white,
          child: Column(
            children: <Widget>[
              _detailsImage(detailsInfo.image1),
              _detailsTitle(detailsInfo.goodsName),
              _detailsUid(detailsInfo.shopId),
              _detailsPrice(detailsInfo.presentPrice, detailsInfo.oriPrice)
            ],
          ),
        );
      } else {
        return Container(
          width: ScreenUtil().setWidth(750),
          child: Text('暂无数据'),
        );
      }
    });
  }

  Widget _detailsImage(uri) {
    return Image.network(
      uri,
      width: ScreenUtil().setHeight(750),
    );
  }

  Widget _detailsTitle(title) {
    return Container(
      width: ScreenUtil().setWidth(750),
      margin: EdgeInsets.all(5),
      padding: EdgeInsets.only(top: 5),
      child: Text(
        title,
        style: TextStyle(fontSize: ScreenUtil().setSp(35)),
      ),
    );
  }

  Widget _detailsUid(uid) {
    return Container(
      width: ScreenUtil().setWidth(750),
      margin: EdgeInsets.only(left: 5),
      child: Text(
        '编号:' + '${uid}',
        style:
            TextStyle(color: Colors.black12, fontSize: ScreenUtil().setSp(23)),
      ),
    );
  }

  Widget _detailsPrice(new_price, old_price) {
    return Container(
      width: ScreenUtil().setWidth(750),
      margin:EdgeInsets.only(left: 5),
      child: Row(
        children: <Widget>[
          Text(
            '￥${new_price}',
            style:
                TextStyle(color: Colors.red, fontSize: ScreenUtil().setSp(40)),
          ),
          Text(
            '市场价：￥${old_price}',
            style: TextStyle(
                color: Colors.black,
                fontSize: ScreenUtil().setSp(20),
                decoration: TextDecoration.lineThrough),
          )
        ],
      ),
    );
  }
}
