import 'package:via_cep/model/via_cep.dart';
import 'package:via_cep/repository/custom_dio.dart';
import 'package:via_cep/repository/via_cep/via_cep_repository.dart';

class ViaCepDioRepository implements ViaCepRepository {
  @override
  Future<ViaCep> getCep(String cep) async {
    var customDio = CustomDio();
    var response = await customDio.dio.get('/$cep/json/');
    if (response.statusCode == 200) {
      return ViaCep.fromJson(response.data);
    }
    return ViaCep();
  }
}
