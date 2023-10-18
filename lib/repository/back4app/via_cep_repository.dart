import 'package:via_cep/model/via_cep.dart';
import 'package:via_cep/repository/back4app/custom_dio.dart';

class ViaCepRepository {
  final _customDio = CustomDio();

  ViaCepRepository();

  Future<ViaCep> consultarCep(String cep) async {
    var url = "/Cep";
    url = '$url?where={"cep":"$cep"}';
    var result = await _customDio.dio.get(url);
    if (result.data['results'].isNotEmpty) {
      var resultFromJson = ViaCep.fromJson(result.data['results'][0]);
      if (resultFromJson.objectId != null) {
        return resultFromJson;
      }
    }
    return ViaCep.vazio();
  }

  Future<ViaCeps> consultarCeps() async {
    var url = "/Cep";

    var result = await _customDio.dio.get(url);
    return ViaCeps.fromJson(result.data);
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
      await _customDio.dio
          .put("/Cep/${cep.objectId}", data: cep.toUpdateJson());
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
