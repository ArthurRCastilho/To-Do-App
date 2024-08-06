import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class RowAppBarToDo extends StatelessWidget {
  const RowAppBarToDo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final DateTime dateNow = DateTime.now();
    final String formattedDate = DateFormat('MMM d ,yyyy').format(dateNow);
    final String formattedTime = DateFormat('h:mm a').format(dateNow);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Row(
          children: [
            CircleAvatar(
              backgroundColor: Color(0xff7F7F7F),
            ),
            SizedBox(width: 10),
            Text('To Do List'),
          ],
        ),
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color(0xffE1E1E3),
              ),
              child: Text(
                formattedDate,
                style: const TextStyle(
                  color: Colors.blue,
                  fontSize: 13,
                ),
              ),
            ),
            const SizedBox(width: 10),
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color(0xffE1E1E3),
              ),
              child: Text(
                formattedTime,
                style: const TextStyle(
                  color: Colors.blue,
                  fontSize: 13,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
