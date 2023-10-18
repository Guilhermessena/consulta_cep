import 'package:flutter/material.dart';
import 'package:via_cep/model/via_cep.dart';
import 'package:via_cep/repository/back4app/via_cep_repository.dart';
import 'package:via_cep/repository/via_cep/impl/via_cep_dio_repository.dart';

class ConsultaCepPage extends StatefulWidget {
  const ConsultaCepPage({super.key});

  @override
  State<ConsultaCepPage> createState() => _ConsultaCepPageState();
}

class _ConsultaCepPageState extends State<ConsultaCepPage> {
  var cepController = TextEditingController(text: '');
  bool loading = false;
  var viaCep = ViaCep();
  var cepBack4app = ViaCep.vazio();
  late ViaCepDioRepository viaCepDioRepository;
  var cepRepository = ViaCepRepository();

  @override
  void initState() {
    carregarDados();
    super.initState();
  }

  carregarDados() {
    viaCepDioRepository = ViaCepDioRepository();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text("Consulta CEP"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 8.0,
          horizontal: 16,
        ),
        child: Column(
          children: [
            const Text(
              'Consulta de cep',
              style: TextStyle(
                fontSize: 22,
              ),
            ),
            TextField(
              controller: cepController,
              keyboardType: TextInputType.number,
              onChanged: (value) async {
                var cep = value.replaceAll(RegExp(r'[^0-9]'), '');
                if (cep.length == 8) {
                  setState(() {
                    loading = true;
                  });

                  viaCep = await viaCepDioRepository.getCep(cep);
                  if (viaCep.cep != null) {
                    cepBack4app = await cepRepository.consultarCep(viaCep.cep!);
                    setState(() {
                      loading = false;
                    });
                    if (cepBack4app.objectId == null) {
                      if (context.mounted) {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text("Adicionar Cep na lista"),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text("Cancelar"),
                                ),
                                TextButton(
                                  onPressed: () async {
                                    setState(() {
                                      loading = true;
                                    });
                                    await cepRepository.salvarCep(ViaCep.create(
                                      bairro: viaCep.bairro,
                                      cep: viaCep.cep,
                                      complemento: viaCep.complemento,
                                      ddd: viaCep.ddd,
                                      gia: viaCep.gia,
                                      ibge: viaCep.ibge,
                                      localidade: viaCep.localidade,
                                      logradouro: viaCep.logradouro,
                                      siafi: viaCep.siafi,
                                      uf: viaCep.uf,
                                    ));
                                    setState(() {
                                      loading = false;
                                    });
                                    if (context.mounted) {
                                      Navigator.pop(context);
                                    }
                                  },
                                  child: const Text("Salvar"),
                                ),
                              ],
                            );
                          },
                        );
                      }
                    }
                  } else {
                    cepController.clear();
                    setState(() {
                      loading = false;
                    });
                  }
                }
              },
            ),
            const SizedBox(
              height: 50,
            ),
            Text(
              viaCep.logradouro ?? "",
              style: const TextStyle(
                fontSize: 22,
              ),
            ),
            Text(
              '${viaCep.localidade ?? ''} - ${viaCep.uf ?? ''}',
              style: const TextStyle(
                fontSize: 22,
              ),
            ),
            Visibility(
              visible: loading,
              child: const CircularProgressIndicator(),
            ),
          ],
        ),
      ),
    ));
  }
}
