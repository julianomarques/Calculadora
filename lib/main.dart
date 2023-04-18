// ignore_for_file: prefer_const_constructors, prefer_is_empty

import 'dart:ffi';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String numero = '0';
  double primeironumero = 0.0;
  String operacao = '';
  // String resultadoPastes = '';

  void calcular(String tecla) {
    switch (tecla) {
      case '0':
      case '1':
      case '2':
      case '3':
      case '4':
      case '5':
      case '6':
      case '7':
      case '8':
      case '9':
        setState(() {
          numero += tecla;
          numero = numero.replaceAll(',', '.');

          if (numero.contains('.')) {
            // double numerodouble = double.parse(numero);
            //  numero = numerodouble.toString();
          } else {
            int numeroInt = int.parse(numero);
            numero = numeroInt.toString();
          }
          numero = numero.replaceAll('.', ',');
        });
        break;

      case '+':
      case '-':
      case 'X':
      case '/':
        operacao = tecla;
        numero = numero.replaceAll(',', '.');
        primeironumero = double.parse(numero);
        numero = numero.replaceAll('.', ',');
        numero = '0';
        break;

      case '=':
        double resultado = 0.0;
        if (operacao == '/') {
          if (double.parse(numero) * 1 == 0) {
            print('erro: Divisao por Zero');
            return;
          }
        }

        if (operacao == '+') {
          resultado = primeironumero + double.parse(numero);
        }
        if (operacao == '-') {
          resultado = primeironumero - double.parse(numero);
        }
        if (operacao == 'X') {
          resultado = primeironumero * double.parse(numero);
        }
        if (operacao == '/') {
          resultado = primeironumero / double.parse(numero);
        }
        String resultadoString = resultado.toString();
        //3  -  0
        // parte1 3 parte2 0

        List<String> resultadoPartes = resultadoString.split('.');

        if (int.parse(resultadoPartes[1]) * 1 == 0) {
          int resultadoformatado = int.parse(resultadoPartes[0]);

          setState(() {
            numero = int.parse(resultadoPartes[0]).toString();
          });
        } else {
          setState(() {
            numero = resultado.toString();
          });
        }
        break;

      case 'AC':
        setState(() {
          numero = '0';
        });

        break;

      case '<=':
        setState(() {
          if (numero.length > 0) {
            numero = numero.substring(0, numero.length - 1);
          }
        });
        break;

      default:
        numero += tecla;
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('Calculadora')),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  numero,
                  style: const TextStyle(fontSize: 48),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () => calcular('AC'),
                  child: Text(
                    'AC',
                    style: const TextStyle(fontSize: 48),
                  ),
                ),
                TextButton(
                  child: Text(
                    ':)',
                    style: const TextStyle(fontSize: 48),
                  ),
                  onPressed: () {
                    //
                  },
                ),
                Text(''),
                GestureDetector(
                  onTap: () => calcular(''),
                  child: GestureDetector(
                    onTap: () => calcular('<='),
                    child: Image.asset(
                      'assets/images/back.png',
                      width: 72,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    calcular('7');
                  },
                  child: Text(
                    '7',
                    style: TextStyle(fontSize: 48),
                  ),
                ),
                GestureDetector(
                  onTap: () => calcular('8'),
                  child: Text(
                    '8',
                    style: TextStyle(fontSize: 48),
                  ),
                ),
                GestureDetector(
                  onTap: () => calcular('9'),
                  child: Text(
                    '9',
                    style: TextStyle(fontSize: 48),
                  ),
                ),
                GestureDetector(
                  onTap: () => calcular('/'),
                  child: Text(
                    '/',
                    style: TextStyle(fontSize: 48),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () => calcular('4'),
                  child: Text(
                    '4',
                    style: TextStyle(fontSize: 48),
                  ),
                ),
                GestureDetector(
                  onTap: () => calcular('5'),
                  child: Text(
                    '5',
                    style: TextStyle(fontSize: 48),
                  ),
                ),
                GestureDetector(
                  onTap: () => calcular('6'),
                  child: Text(
                    '6',
                    style: TextStyle(fontSize: 48),
                  ),
                ),
                GestureDetector(
                  onTap: () => calcular('X'),
                  child: Text(
                    'X',
                    style: TextStyle(fontSize: 48),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () => calcular('1'),
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Color.fromARGB(255, 22, 72, 236)),
                    child: Center(
                        child: Text(
                      '1',
                      style: TextStyle(fontSize: 48, color: Colors.white),
                    )),
                  ),
                ),
                GestureDetector(
                  onTap: () => calcular('2'),
                  child: Text(
                    '2',
                    style: TextStyle(fontSize: 48),
                  ),
                ),
                GestureDetector(
                  onTap: () => calcular('3'),
                  child: Text(
                    '3',
                    style: TextStyle(fontSize: 48),
                  ),
                ),
                GestureDetector(
                  onTap: () => calcular('-'),
                  child: Text(
                    '-',
                    style: TextStyle(fontSize: 48),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () => calcular('0'),
                  child: Text(
                    '0',
                    style: TextStyle(fontSize: 48),
                  ),
                ),
                GestureDetector(
                  onTap: () => calcular(','),
                  child: Text(
                    ',',
                    style: TextStyle(fontSize: 48),
                  ),
                ),
                GestureDetector(
                  onTap: () => calcular('='),
                  child: Text(
                    '=',
                    style: TextStyle(fontSize: 48),
                  ),
                ),
                GestureDetector(
                    onTap: () => calcular('+'),
                    child: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.black),
                        child: Center(
                          child: Text(
                            '+',
                            style: TextStyle(fontSize: 48, color: Colors.white),
                          ),
                        ))),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
