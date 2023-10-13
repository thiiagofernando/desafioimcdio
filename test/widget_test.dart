import 'package:desafioimcdio/bloc/imc.bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Valida se os campos não foram preenchidos', () {
    final bloc = ImcBloc();
    bloc.calcularImc();
    expect(bloc.result, equals('Informe todos os dados'));
  });
  test('Deve retornar IMC Saudável', () {
    final bloc = ImcBloc();
    bloc.nomeCtrl.text = 'Joaozinho';
    bloc.alturaCtrl.text = '166';
    bloc.pesoCtrl.text = '78';
    bloc.calcularImc();
    expect(bloc.result, contains('Saudável'));
  });
  test('Deve retornar IMC Magreza grave', () {
    final bloc = ImcBloc();
    bloc.nomeCtrl.text = 'Joaozinho';
    bloc.alturaCtrl.text = '160';
    bloc.pesoCtrl.text = '30';
    bloc.calcularImc();
    expect(bloc.result, contains('Magreza grave'));
  });
}
