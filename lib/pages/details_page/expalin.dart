import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ExpalinView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: _explain(),
    );
  }

  Widget _explain() {
    return Container(
      width: ScreenUtil().setWidth(750),
      height: ScreenUtil().setHeight(50),
      margin: EdgeInsets.all(5),
      padding: EdgeInsets.only(left: 5, top:5, bottom:5),
      color: Colors.white,
      child: Text(
        '说明： >> 急速送达 >> 上门送货',
        style: TextStyle(
          fontSize: ScreenUtil().setSp(30),
          color: Colors.orange,
        ),
      ),
    );
  }
}
