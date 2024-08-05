import 'package:flutter/material.dart';
import 'package:to_do_app/components/box_list_to_do.dart';
import 'package:to_do_app/components/floating_button.dart';
import 'package:to_do_app/components/row_app_bar_to_do.dart';
import 'package:to_do_app/components/text_list_do.dart';
import 'package:to_do_app/core/models/to_do.dart';
import 'package:to_do_app/core/services/to_do_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Stream<List<ToDo>> _toDos = ToDoService().toDoStream();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const RowAppBarToDo(),
      ),
      body: StreamBuilder(
        stream: _toDos,
        builder: (ctx, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextListDo(),
                Center(child: Text('Nenhuma tarefa adicionada ainda.')),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(50.0),
                    child: FloatingButton(),
                  ),
                ),
              ],
            );
          } else {
            List<ToDo> toDos = snapshot.data!;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TextListDo(),
                Expanded(
                  child: Stack(
                    children: [
                      ListView.builder(
                        itemCount: toDos.length,
                        itemBuilder: (context, index) {
                          final toDo = toDos[index];
                          return BoxListToDo(toDo: toDo);
                        },
                      ),
                      const Positioned(
                        bottom: 50,
                        left: 0,
                        right: 0,
                        child: Center(child: FloatingButton()),
                      ),
                    ],
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
