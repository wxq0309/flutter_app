import 'package:flutter/material.dart';
import 'package:project1/model/categoryGoodsList.dart';
import './pages/index_page.dart';
import 'package:provide/provide.dart';
import './provide/child_category.dart';
import './provide/category_goods_list.dart';


// void main() => runApp(MyApp());
void main(){
  var childCategory = ChildCategory();
  var providers = Providers();
  var categoryGoodsListProvide = CategoryGoodsListProvide();
  providers
  ..provide(Provider<ChildCategory>.value(childCategory))
  ..provide(Provider<CategoryGoodsListProvide>.value(categoryGoodsListProvide));
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