import 'package:flutter/cupertino.dart';
import './questao.dart';
import './resposta.dart';

class Questionario extends StatelessWidget {
  final List<Map<String, Object>> pergunta;
  final perguntaSelecionada;
  final void Function(int) responder;

  const Questionario(
      {required this.pergunta,
      required this.perguntaSelecionada,
      required this.responder,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool respostaSelecionada() {
      return perguntaSelecionada < pergunta.length;
    }

    List<Map<String, Object>> respostas = respostaSelecionada()
        ? pergunta[perguntaSelecionada].cast()['resposta']
        : [];

    return Column(
      children: [
        Questao(pergunta[perguntaSelecionada]['texto'].toString()),
        ...respostas
            .map((resp) => Resposta(resp['texto'].toString(),
                () => responder(int.parse(resp['nota'].toString()))))
            .toList(),
      ],
    );
  }
}
