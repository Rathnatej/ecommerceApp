import 'dart:convert';


import 'package:ecommerce_flutter/constants/utils.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<void> httpErrorHandle({
  required http.Response response,
  required BuildContext context,
  required VoidCallback onSuccess,
}) async {
  switch (response.statusCode) {
    case 201:
      showSnackBar(context, jsonDecode(response.body)['msg']);
      break;
    case 400: 
      showSnackBar(context, jsonDecode(response.body)['msg']);
      break;
    case 500:
      showSnackBar(context, jsonDecode(response.body)['error']);
      break;
    default:
      showSnackBar(context, response.body);
  }
}