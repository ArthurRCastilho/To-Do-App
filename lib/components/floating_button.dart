import 'package:flutter/material.dart';
import 'package:to_do_app/components/form_new_to_do.dart';

class FloatingButton extends StatelessWidget {
  const FloatingButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.black,
      child: const Icon(
        Icons.add,
        color: Colors.white,
        size: 30,
      ),
      onPressed: () {
        showModalBottomSheet(
          context: context,
          builder: (context) {
            return const FormNewToDo();
          },
        );
      },
    );
  }
}

