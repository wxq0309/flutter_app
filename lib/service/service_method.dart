import 'package:dio/dio.dart';
import 'dart:io';
import 'dart:async';
import '../config/service_url.dart';

Future request(url, {data}) async {
  Response response;
  Dio dio = new Dio();
  dio.options.contentType =
      ContentType.parse('application/x-www-form-urlencoded');
  if (data==null) {
    response = await dio.post(servicePath[url]);
  } else {
    response = await dio.post(
      servicePath[url],data:data
    );
  }
  if (response.statusCode == 200) {
    return response.data;
  } else {
    return Exception("异常");
  }
}

//获取首页内容
Future getHomePageContent() async {
  Response response;
  Dio dio = new Dio();
  dio.options.contentType =
      ContentType.parse('application/x-www-form-urlencoded');

  var formData = {'lon': '115.02932', "lat": '35.76189'};
  response = await dio.post(servicePath['homePageContent'], data: formData);
  if (response.statusCode == 200) {
    return response.data;
  } else {
    return Exception("异常");
  }
}

//获取首页火爆内容
Future gethomePageBelowConten() async {
  Response response;
  Dio dio = new Dio();
  dio.options.contentType =
      ContentType.parse('application/x-www-form-urlencoded');

  // var formData = {'lon':'115.02932', "lat":'35.76189'};
  int page = 1;
  response = await dio.post(servicePath['homePageBelowConten'], data: page);
  if (response.statusCode == 200) {
    return response.data;
  } else {
    return Exception("异常");
  }
}
