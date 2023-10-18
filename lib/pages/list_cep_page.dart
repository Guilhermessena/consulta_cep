import 'package:flutter/material.dart';
import 'package:via_cep/model/via_cep.dart';
import 'package:via_cep/repository/back4app/via_cep_repository.dart';

class ListCepPage extends StatefulWidget {
  const ListCepPage({super.key});

  @override
  State<ListCepPage> createState() => _ListCepPageState();
}

class _ListCepPageState extends State<ListCepPage> {
  var cepRepository = ViaCepRepository();
  var logradouroController = TextEditingController(text: '');
  var _ceps = ViaCeps();
  var carregando = false;

  @override
  void initState() {
    carregarDados();
    super.initState();
  }

  void carregarDados() async {
    setState(() {
      carregando = true;
    });
    _ceps = await cepRepository.consultarCeps();
    setState(() {
      carregando = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ceps registrados'),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: carregando
            ? const Center(child: CircularProgressIndicator())
            : Expanded(
                child: ListView.builder(
                  itemCount: _ceps.viaCeps!.length,
                  itemBuilder: (context, index) {
                    var cep = _ceps.viaCeps![index];
                    return Dismissible(
                      key: Key(cep.objectId ?? ''),
                      onDismissed: (direction) async {
                        await cepRepository.removerCep(cep.objectId!);
                        carregarDados();
                      },
                      child: Card(
                        elevation: 3,
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        child: Expanded(
                          child: Container(
                            margin: const EdgeInsets.all(10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      cep.logradouro ?? '',
                                      style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Text(cep.cep ?? ''),
                                  ],
                                ),
                                IconButton(
                                    onPressed: () {
                                      logradouroController.text =
                                          cep.logradouro!;
                                      showDialog(
                                        context: context,
                                        builder: (context) {
                                          return AlertDialog(
                                            title: const Text("Atualizar Cep"),
                                            content: TextField(
                                              controller: logradouroController,
                                            ),
                                            actions: [
                                              TextButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                child: const Text("Cancelar"),
                                              ),
                                              TextButton(
                                                onPressed: () async {
                                                  cep.logradouro =
                                                      logradouroController.text;
                                                  await cepRepository
                                                      .atualizarCep(cep);
                                                  carregarDados();
                                                  if (context.mounted) {
                                                    Navigator.pop(context);
                                                  }
                                                },
                                                child: const Text("Atualizar"),
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    },
                                    icon: const Icon(Icons.edit_outlined))
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
      ),
    );
  }
}
