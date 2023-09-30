
import 'package:caluladora_imc/caluladora_imc.dart' as app;
import 'package:caluladora_imc/pessoa.dart';
import 'package:test/test.dart';

void main() {
  test('Calcula imc', () {
    expect(app.calcularIMC(Pessoa("Luiz", 100, 2)), equals(25));
  });

  test('Calcula imc(ERRO)', () {
    expect(app.calcularIMC(Pessoa("Luiz", 100, 2)), equals(23));
  });

}




