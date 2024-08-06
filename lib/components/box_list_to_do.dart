import 'package:flutter/material.dart';
import 'package:to_do_app/core/models/to_do.dart';
import 'package:to_do_app/core/services/to_do_service.dart';

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
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(widget.toDo.id),
      direction: DismissDirection.endToStart,
      onDismissed: (_) {
        ToDoService().remove(widget.toDo);
      },
      child: Padding(
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
                      backgroundColor: widget.toDo.isConclued
                          ? Colors.green
                          : const Color(0xff7F7F7F),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                      onPressed: () {},
                      child: const Icon(Icons.check),
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
      ),
    );
  }
}
