import 'package:via_cep/model/via_cep.dart';
import 'package:via_cep/repository/back4app/custom_dio.dart';

class ViaCepRepository {
  final _customDio = CustomDio();

  ViaCepRepository();

  Future<ViaCep> consultarCep(String cep) async {
    var url = "/Cep";
    url = '$url?where={"cep":$cep}';

    var result = await _customDio.dio.get(url);
    return ViaCep.fromJson(result.data);
  }

  Future<void> salvarCep(ViaCep cep) async {
    try {
      await _customDio.dio.post("/Cep", data: cep.toCreateJson());
    } catch (e) {
      throw e;
    }
  }

  Future<void> atualizarCep(ViaCep cep) async {
    try {
      await _customDio.dio.put("/Cep/${cep.objectId}", data: cep.toCreateJson());
    } catch (e) {
      throw e;
    }
  }

  Future<void> removerCep(String objectId) async {
    try {
      await _customDio.dio.delete("/Cep/$objectId");
    } catch (e) {
      throw e;
    }
  }
}
