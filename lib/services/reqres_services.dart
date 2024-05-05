import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:reqres_api/model/reqres_model.dart';

abstract class IReqresService {
  Future<List<ReqresModel>?> fetchItemPostAdvance();
}

class ReqresService implements IReqresService {
  late final Dio _dio;
  ReqresService() : _dio = Dio(BaseOptions(baseUrl: 'https://reqres.in/api/'));

  @override
  Future<List<ReqresModel>?> fetchItemPostAdvance() async {
    try {
      final response = await _dio.get('users?page');
      if (response.statusCode == HttpStatus.ok) {
        final datas = response.data['data'];
        if (datas is List) {
          return datas.map<ReqresModel>((e) => ReqresModel.fromJson(e)).toList();
        }
      }
    } on DioException catch (exception) {
      _ShowDebug()._showDioException(exception, this);
    }
    return null;
  }
}

class _ShowDebug {
  void _showDioException<T>(DioException exception, T type) {
    if (kDebugMode) {
      print(exception.message);
      print(type);
      print('------------------------');
    }
  }
}
