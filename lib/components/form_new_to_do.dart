import 'package:flutter/material.dart';
import 'package:to_do_app/core/services/to_do_service.dart';

class FormNewToDo extends StatefulWidget {
  const FormNewToDo({
    super.key,
  });

  @override
  State<FormNewToDo> createState() => _FormNewToDoState();
}

class _FormNewToDoState extends State<FormNewToDo> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _dateController = TextEditingController();
  DateTime? _selectedDate;

  String? _validarTitulo(String titulo) {
    if (titulo.length < 4) return 'O titulo precisa ter mais que 5 letras';
    if (titulo.length >= 16)
      return 'O titulo não pode conter mais que 15 letras';
    return null;
  }

  String? _validarDescricao(String titulo) {
    if (titulo.length < 4) return 'A descrição necessita pelo menos 5 letras';
    if (titulo.length > 50)
      return 'A descrição não pode ter mais que 50 letras';
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(40),
      ),
      height: screenSize.height,
      child: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Criar uma nova Tarefa!',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  TextFormField(
                    validator: (value) => _validarTitulo(value!),
                    controller: _titleController,
                    decoration: const InputDecoration(
                      labelText: 'Título',
                      labelStyle: TextStyle(color: Colors.black),
                      hintText: 'Digite o título da sua tarefa',
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    validator: (value) => _validarDescricao(value!),
                    controller: _descriptionController,
                    decoration: const InputDecoration(
                      labelText: 'Descrição',
                      labelStyle: TextStyle(color: Colors.black),
                      hintText: 'Digite a descrição da sua tarefa',
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  DatePicker(context),
                ],
              ),
            ),
            SizedBox(
              width: 200,
              height: 45,
              child: FloatingActionButton(
                backgroundColor: const Color(0xff66558F),
                child: const Text(
                  'Adicionar nova Tarefa',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    await ToDoService().save(
                      _titleController.text,
                      _descriptionController.text,
                      _selectedDate,
                    );
                    Navigator.of(context).pop();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Row DatePicker(BuildContext context) {
    return Row(
      children: [
        const Text('Data: '),
        Center(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                        context: context,
                        firstDate: DateTime(2024),
                        lastDate: DateTime(2050),
                      );
                      if (pickedDate != null) {
                        setState(() {
                          _selectedDate = pickedDate;
                          _dateController.text =
                              "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
                        });
                      }
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 5,
                      ),
                      child: Row(
                        children: [
                          Text(
                            _selectedDate != null
                                ? "${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}"
                                : 'Selecionar a Data',
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
