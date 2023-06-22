// Funcionando

import 'dart:math';
import 'package:flutter/material.dart';

class homeScreen extends StatefulWidget {
  const homeScreen({Key? key}) : super(key: key);
  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  var cpuChoice = '';
  var userChoice = '';
  var escolhaMaquina = '';
  var resultado = 'Faça uma jogada';

  void validaJogada(jogadaCPU, jogadaUser) {
    switch (jogadaUser) {
      case 'papel':
        if (jogadaCPU == 'papel') {
          resultado = 'Empate!';
        } else if (jogadaCPU == 'tesoura') {
          resultado = 'Você Perdeu!!';
        } else {
          resultado = 'Você ganhou!!';
        }
        break;
      case 'pedra':
        if (jogadaCPU == 'pedra') {
          resultado = 'Empate!';
        } else if (jogadaCPU == 'papel') {
          resultado = 'Você perdeu!!';
        } else {
          resultado = 'Você ganhou!!';
        }
        break;
      case 'tesoura':
        if (jogadaCPU == 'tesoura') {
          resultado = 'Empate!';
        } else if (jogadaCPU == 'pedra') {
          resultado = 'Você perdeu!!';
        } else {
          resultado = 'Você ganhou!!';
        }
        break;
    }
  }

  void jogaPPT() {
    var cpuSort = 0;
    setState(() {
      cpuSort = Random().nextInt(4) + 1;
      if (cpuSort == 1) {
        cpuChoice = 'pedra';
        escolhaMaquina = 'assets/images/pedra.png';
      } else if (cpuSort == 2) {
        cpuChoice = 'papel';
        escolhaMaquina = 'assets/images/papel.png';
      } else {
        cpuChoice = 'tesoura';
        escolhaMaquina = 'assets/images/tesoura.png';
      }
      validaJogada(cpuChoice, userChoice);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Pedra,Papel ou Tesoura')),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            const Center(
              child: Text(
                'Selecione uma das opções abaixo',
                style: TextStyle(fontSize: 17),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 100,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        userChoice = 'pedra';
                        jogaPPT();
                      });
                    },
                    child: Image.asset('assets/images/pedra.png'),
                  ),
                ),
                Container(
                  width: 100,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        userChoice = 'papel';
                        jogaPPT();
                      });
                    },
                    child: Image.asset('assets/images/papel.png'),
                  ),
                ),
                Container(
                  width: 100,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        userChoice = 'tesoura';
                        jogaPPT();
                      });
                    },
                    child: Image.asset('assets/images/tesoura.png'),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Text("Escolha da maquina: ", style: TextStyle(fontSize: 17)),
            const SizedBox(
              height: 10,
            ),
            Container(
              width: 100,
              child: Image.asset(escolhaMaquina),
            ),
            const SizedBox(
              height: 40,
            ),
            Text('Resultado: $resultado'),
          ],
        ),
      ),
    );
  }
}
