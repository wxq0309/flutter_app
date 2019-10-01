import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provide/provide.dart';
import '../../provide/details_info.dart';

class TabBarView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: ScreenUtil().setWidth(750),
      child: _barTools(context),
    );
  }

  Widget _barTools(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(750),
      margin: EdgeInsets.all(5),
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          InkWell(
            onTap: () {
              Provide.value<DetailsInfoProvide>(context).changeItem('left');
              print('点击了详情');
            },
            child: Text(
              '详情',
              style: TextStyle(
                  color: Colors.black, fontSize: ScreenUtil().setSp(30)),
            ),
          ),
          InkWell(
              onTap: () {
                Provide.value<DetailsInfoProvide>(context).changeItem('right');
                print('点击了评论');
              },
              child: Text(
                '评论',
                style: TextStyle(
                    color: Colors.black, fontSize: ScreenUtil().setSp(30)),
              ))
        ],
      ),
    );
  }
}
