import 'package:via_cep/model/via_cep.dart';

abstract class ViaCepRepository {
  Future<ViaCep> getCep(String cep);
}
