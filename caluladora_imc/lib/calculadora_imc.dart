import 'dart:io';

import 'package:caluladora_imc/exception/nome_invalido_exception.dart';
import 'package:caluladora_imc/pessoa.dart';
import 'package:caluladora_imc/utils.dart';

void execute() {
  print("Calculadora IMC");

  // Leitura dos dados da pessoa.
  String nome = Utils.lerStringComTexto("Digite seu nome:");
  try {
    if (nome.trim() == "") {
      throw NomeInvalidoException();
    }
  } catch (nomeInvalidoException) {
    nome = "Nome Padrão";
    print(NomeInvalidoException);
    exit(0);
  }

  double peso = Utils.lerDoubleComTexto("Digite seu peso em Kg:")!;
  double altura = Utils.lerDoubleComTexto("Digite sua altura em metros:")!;

  var pessoa = Pessoa(nome, peso, altura);
  double imc = calcularIMC(pessoa);

  print("$nome seu imc é $imc.");

  if (imc < 16) {
    print("Magreza grave.");
  } else if (imc > 16 && imc <= 17) {
    print("Magreza moderada.");
  } else if (imc > 17 && imc <= 18.5) {
    print("Magreza leve.");
  } else if (imc > 18.5 && imc <= 25) {
    print("Saudável.");
  } else if (imc > 25 && imc <= 30) {
    print("Sobrepeso.");
  } else if (imc > 30 && imc <= 35) {
    print("Obesidade Grau 1.");
  } else if (imc > 35 && imc <= 40) {
    print("Obesidade Grau 2.(Severa)");
  } else {
    print("Obesidade Grau 3. (Mórbida)");
  }
}

double calcularIMC(Pessoa pessoa) {
    return pessoa.peso / (pessoa.altura * pessoa.altura);
  }
