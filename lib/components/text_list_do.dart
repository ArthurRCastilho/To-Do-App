import 'package:flutter/material.dart';

class TextListDo extends StatelessWidget {
  const TextListDo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: const EdgeInsets.all(20.0),
      child: Text(
        'Lista de Tarefas:',
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
    );
  }
}