import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class CustomDio {
  final  _dio = Dio();

  Dio get dio=> _dio;
  CustomDio(){
    var url = dotenv.get('VIACEPURL', fallback: 'sane-default');
    _dio.options.baseUrl = url;
  }

}