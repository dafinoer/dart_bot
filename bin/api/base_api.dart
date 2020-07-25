

import 'dart:io';

import 'package:dio/dio.dart';

class BaseApi {
  final Dio dio = Dio();

  Future<dynamic> getService(String url, {Map<String, dynamic> params}) async {
    try {
      final result = await dio.get(url, queryParameters: params);
      if(result.statusCode != 200){
        throw HttpException(result.statusMessage);
      }
      return result.data;
    } on Exception catch (e){
      throw Exception(e);
    }
  }
}