import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final nota;
  final void Function() reiniciando;
  const Resultado(this.nota, this.reiniciando, {Key? key}) : super(key: key);

  String get frazes {
    if (nota < 10) {
      return 'brabo';
    } else if (nota == 10) {
      return 'Vc é demais!';
    } else {
      return 'Nivel Sayajin';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
            child: Text(
          frazes,
          style: const TextStyle(fontSize: 50),
        )),
        TextButton(
          onPressed: reiniciando,
          child: const Text(
            'reinicializar?',
            style: TextStyle(
              fontSize: 18,
              color: Colors.blue,
            ),
          ),
        )
      ],
    );
  }
}
