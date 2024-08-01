import 'package:flutter/material.dart';
import 'package:to_do_app/models/to_do.dart';

class BoxListToDo extends StatefulWidget {
  final ToDo toDo;

  const BoxListToDo({
    super.key,
    required this.toDo,
  });

  @override
  State<BoxListToDo> createState() => _BoxListToDoState();
}

class _BoxListToDoState extends State<BoxListToDo> {
  bool isCheck = false;

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
              widget.toDo.title,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(widget.toDo.description),
                Container(
                  height: 40,
                  width: 40,
                  child: FloatingActionButton(
                    backgroundColor:
                        isCheck ? Colors.green : const Color(0xff7F7F7F),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                    ),
                    onPressed: () {
                      setState(() {
                        isCheck = !isCheck;
                      });
                    },
                    child: Icon(Icons.check),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                widget.toDo.date == null
                    ? const SizedBox()
                    : Text(
                        '${widget.toDo.date!.day}/${widget.toDo.date!.month}/${widget.toDo.date!.year}',
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
