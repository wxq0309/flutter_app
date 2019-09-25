import 'package:flutter/material.dart';
import './pages/index_page.dart';
import 'package:provide/provide.dart';
import './provide/child_category.dart';

// void main() => runApp(MyApp());
void main(){
  var childCategory = ChildCategory();
  var providers = Providers();
  providers..provide(Provider<ChildCategory>.value(childCategory));
  runApp(ProviderNode(child: MyApp(),providers: providers,));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: MaterialApp(
        title: '数据测试APP',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.cyan
        ),
        home: IndexPage(),
      ),
    );
  }
}