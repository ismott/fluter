import 'package:flutter/material.dart';
import './questao.dart';
import './resposta.dart';
import './resultado.dart';
import './questionario.dart';

main() => runApp(const PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  var notaTotal = 0;
  final List<Map<String, Object>> _pergunta = const [
    {
      'texto': 'Qual a sua cor favorita?',
      'resposta': [
        {'texto': 'preto', 'nota': 5},
        {'texto': 'azul', 'nota': 5},
        {'texto': 'vermelho', 'nota': 5},
        {'texto': 'branco', 'nota': 5},
      ],
    },
    {
      'texto': 'Qual o seu animal favorito?',
      'resposta': [
        {'texto': 'mamaco', 'nota': 5},
        {'texto': 'leão', 'nota': 5},
        {'texto': 'tigre', 'nota': 5},
        {'texto': 'elefante', 'nota': 5},
      ],
    },
    {
      'texto': 'Qual o seu time favorito?',
      'resposta': [
        {'texto': 'Bayer', 'nota': 5},
        {'texto': 'Barcelona', 'nota': 5},
        {'texto': 'PSG', 'nota': 5},
        {'texto': 'Real Madrid', 'nota': 5},
      ],
    }
  ];
  void _responder(int nota) {
    // ignore: avoid_print
    print(notaTotal);
    if (respostaSelecionada()) {
      setState(() {
        _perguntaSelecionada++;
        notaTotal = notaTotal + nota;
      });
    }
  }

  void _reiniciar() {
    setState(() {
      _perguntaSelecionada = 0;
      notaTotal = 0;
    });
  }

  bool respostaSelecionada() {
    return _perguntaSelecionada < _pergunta.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: const Text('Perguntas'),
            ),
            body: respostaSelecionada()
                ? Questionario(
                    pergunta: _pergunta,
                    perguntaSelecionada: _perguntaSelecionada,
                    responder: _responder)
                : Resultado(notaTotal, _reiniciar)));
  }
}

// ignore: must_be_immutable
class PerguntaApp extends StatefulWidget {
  const PerguntaApp({Key? key}) : super(key: key);

  @override
  State<PerguntaApp> createState() => _PerguntaAppState();
}
