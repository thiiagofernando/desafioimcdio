import 'package:desafioimcdio/model/pessoa.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';

class ImcBloc {
  final nomeCtrl = TextEditingController();
  final pesoCtrl = MaskedTextController(mask: '000');
  final alturaCtrl = MaskedTextController(mask: '000');
  var result = 'Preencha os dados para calcular o seu IMC';

  calcularImc() {
    try {
      if (nomeCtrl.text.isEmpty || alturaCtrl.text.isEmpty || pesoCtrl.text.isEmpty) {
        result = 'Informe todos os dados';
      } else {
        double peso = double.parse(pesoCtrl.text);
        double altura = double.parse(alturaCtrl.text) / 100;
        double imc = peso / (altura * altura);

        final pessoa = Pessoa(
          nome: nomeCtrl.text,
          altura: alturaCtrl.text,
          peso: pesoCtrl.text,
        );

        if (imc < 16) {
          result = '${pessoa.toString()} Seu IMC é ${imc.toStringAsFixed(2)} Magreza grave';
        } else if (imc >= 16 && imc < 18.5) {
          result = '${pessoa.toString()} Seu IMC é ${imc.toStringAsFixed(2)} Magreza Moderada';
        } else if (imc >= 18.5 && imc < 25) {
          result = '${pessoa.toString()} Seu IMC é ${imc.toStringAsFixed(2)} Saudável';
        } else if (imc >= 25 && imc < 30) {
          result = '${pessoa.toString()} Seu IMC é ${imc.toStringAsFixed(2)} Saudável';
        } else if (imc >= 30 && imc < 35) {
          result = '${pessoa.toString()} Seu IMC é ${imc.toStringAsFixed(2)} Obesidade Grau 1';
        } else if (imc >= 35 && imc < 40) {
          result = '${pessoa.toString()} Seu IMC é ${imc.toStringAsFixed(2)} Obesidade Grau 2(severa)';
        } else if (imc >= 40) {
          result = '${pessoa.toString()} Seu IMC é ${imc.toStringAsFixed(2)} Obesidade Grau 3(morbida)';
        }
      }
    } catch (e) {
      result = 'Erro no operação';
    }
  }
}
