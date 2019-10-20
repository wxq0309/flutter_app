import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provide/provide.dart';
import '../../provide/cart.dart';


class addOrIncreaseButtom extends StatelessWidget {
  var item;
  addOrIncreaseButtom(this.item);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: ScreenUtil().setWidth(160),
        margin: EdgeInsets.only(left:0),
        decoration: BoxDecoration(
          border:Border.all(width: 1, color: Colors.black12)
        ),
        child: Row(
          children: <Widget>[
            _reduceBtm(context),
            _countArea(),
            _addBtm(context)
          ],
        ),
    );
  }

  Widget _reduceBtm(context){
    return InkWell(
      onTap: (){
        Provide.value<CartProvide>(context).addOrReduce(item,'reduce');
      },
      child: Container(
        width: ScreenUtil().setWidth(45),
        height: ScreenUtil().setHeight(45),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            right: BorderSide(width: 1, color: Colors.black12)
          )
        ),
        child:item.count>1? Text('-'):Text(' '),
      ),
    );
  }

   Widget _addBtm(context){
    return InkWell(
      onTap: (){
         Provide.value<CartProvide>(context).addOrReduce(item,'add');
      },
      child: Container(
        width: ScreenUtil().setWidth(45),
        height: ScreenUtil().setHeight(45),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            left: BorderSide(width: 1, color: Colors.black12)
          )
        ),
        child: Text('+'),
      ),
    );
  }

  Widget _countArea(){
    return Container(
      width: ScreenUtil().setWidth(60),
      height: ScreenUtil().setHeight(45),
      alignment: Alignment.center,
      // decoration: BoxDecoration(
      //   border: Border(
      //     right: BorderSide(width: 1, color: Colors.black12)
      //   )
      // ),
      color: Colors.white,
      child:Text('${item.count}'),
    );
  }
}