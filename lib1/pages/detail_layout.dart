import 'package:flutter/material.dart';

import '../modules/title_section.dart';
import '../modules/icons_section.dart';
import '../modules/text_section.dart';

class DetailPage extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: AppBar(
        title: Text('布局代码'),
      ),
      body: Column(
        children: <Widget>[
          Image.asset('iamges/test.png',
                      width: 600.0,
                      height: 240.0,
                      fit: BoxFit.cover,
          ),
          new TitleSection(),
          new IconsSection(),
          new TextSection()
        ],
      ),
    );
  }
}