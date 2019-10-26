import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MemberPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('个人中心'),
      ),
      body: ListView(
        children: <Widget>[_topArea(),_orderTitle()],
      ),
    );
  }

  Widget _topArea() {
    return Container(
      color: Colors.black12,
      width: ScreenUtil().setWidth(750),
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 20),
            child: ClipOval(
              child: Image.network(
                  'https://tse1-mm.cn.bing.net/th?id=OIP.fBsNKOTUg9ssn28eMhW4_gHaHa&w=99&h=108&c=8&rs=1&qlt=90&pid=3.1&rm=2'),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10, bottom: 10),
            child: Text(
              '我是谁',
              style: TextStyle(
                  fontSize: ScreenUtil().setSp(35), color: Colors.white),
            ),
          )
        ],
      ),
    );
  }

  Widget _orderTitle() {
    return Container(
      margin: EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border(bottom: BorderSide(width: 1, color: Colors.black12))),
      child: ListTile(
        leading: Icon(Icons.list),
        title: Text('我的订单'),
        trailing: Icon(Icons.arrow_right),
      ),
    );
  }
}
