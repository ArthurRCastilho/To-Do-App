import 'package:flutter/material.dart';

class RowAppBarToDo extends StatelessWidget {
  const RowAppBarToDo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Row(
          children: [
            CircularProgressIndicator(),
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
                'Jun 10, 2024',
                style: TextStyle(
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
                '9:41 AM',
                style: TextStyle(
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
