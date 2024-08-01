import 'package:flutter/material.dart';
import 'package:to_do_app/models/to_do.dart';

class BoxListToDo extends StatelessWidget {
  final ToDo toDo;

  const BoxListToDo({
    super.key,
    required this.toDo,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsets.only(
          right: 30,
          top: 10,
          left: 10,
        ),
        width: 250,
        height: 110,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: const Color(0xffD9D9D9),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              toDo.title,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(toDo.description),
                const CircleAvatar(
                  backgroundColor: Color(0xff7F7F7F),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                toDo.date == null
                    ? SizedBox()
                    : Text(
                        '${toDo.date!.day}/${toDo.date!.month}/${toDo.date!.year}',
                      ),
                const SizedBox(width: 40),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
