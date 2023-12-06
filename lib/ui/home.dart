import 'package:desafioimcdio/bloc/imc.bloc.dart';
import 'package:desafioimcdio/constantes/mensagens.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final bloc = ImcBloc();
  final List<String> listaDeImc = <String>[];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculadora IMC'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: TextFormField(
                decoration: const InputDecoration(
                  labelText: "Nome",
                ),
                controller: bloc.nomeCtrl,
                keyboardType: TextInputType.text,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: TextFormField(
                decoration: const InputDecoration(
                  labelText: "Altura (CM)",
                ),
                controller: bloc.alturaCtrl,
                keyboardType: TextInputType.number,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: TextFormField(
                decoration: const InputDecoration(
                  labelText: "Peso (KG)",
                ),
                controller: bloc.pesoCtrl,
                keyboardType: TextInputType.number,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      bloc.calcularImc();
                      if (bloc.result != Mensagens.informeTodosDados && bloc.result != Mensagens.erroOperacao) {
                        listaDeImc.add(bloc.result);
                      }
                    });
                  },
                  child: const Text(
                    "Calcular",
                    style: TextStyle(color: Colors.white),
                  )),
            ),
            const Text('Lista de IMC'),
            Container(
              padding: const EdgeInsets.all(8),
              height: 300,
              width: 400,
              child: Align(
                alignment: Alignment.topCenter,
                child: ListView.builder(
                  reverse: true,
                  shrinkWrap: true,
                  itemCount: listaDeImc.length,
                  itemBuilder: (context, index) {
                    return Text(listaDeImc[index].toString());
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
