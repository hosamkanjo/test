// import 'package:dio/dio.dart';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

Future<List<dynamic>> getAllProdcutsWithDio() async {
  Dio dio = Dio();
  Response response = await dio.get("https://dummyjson.com/products");

  print(response.statusCode);
  print(response.data['products']);
  return response.data['products'];
}

Future<List<dynamic>> getAllProductsWithHttp() async {
  Uri uri = Uri.parse('https://dummyjson.com/products');
  http.Response response = await http.get(uri);
  print(response.statusCode);
  print(response.body);
  Map<String, dynamic> data = json.decode(response.body);
  List<dynamic> listMap = data['products'];
  return listMap;
}
