import 'package:flutter/material.dart';
import 'package:to_do_app/components/floating_button.dart';
import 'package:to_do_app/components/row_app_bar_to_do.dart';
import 'package:to_do_app/components/text_list_do.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const RowAppBarToDo(),
      ),
      body: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextListDo(),
          SizedBox(height: 10),
          Center( // Local onde ficará as Listas de Tarefas
            child: CircularProgressIndicator(),
          ),
          Expanded(child: SizedBox()),
          FloatingButton(),
          Padding(padding: EdgeInsets.all(25)),
        ],
      ),
    );
  }
}
