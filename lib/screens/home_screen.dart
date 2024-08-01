import 'package:flutter/material.dart';
import 'package:to_do_app/components/box_list_to_do.dart';
import 'package:to_do_app/components/floating_button.dart';
import 'package:to_do_app/components/row_app_bar_to_do.dart';
import 'package:to_do_app/components/text_list_do.dart';
import 'package:to_do_app/data/dummy_list_to_do.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const RowAppBarToDo(),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TextListDo(),
          Expanded(
            child: Stack(
              children: [
                ListView.builder(
                  itemCount: DUMMY_TO_DO.length,
                  itemBuilder: (context, index) {
                    final toDo = DUMMY_TO_DO[index];
                    return BoxListToDo(toDo: toDo);
                  },
                ),
                const Positioned(
                  bottom: 50,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: FloatingButton(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
