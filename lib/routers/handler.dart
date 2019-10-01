import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import '../pages/details_page.dart';

Handler detailsHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, dynamic> params) {
      return DetailsPage(params['id'][0]);
    });
