import 'package:flutter/material.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key});

  @override
  State<NewExpense> createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  // using flutter to store the title text in the text field
  final _titleController = TextEditingController();

// using flutter to dispose the title text in the text field afterwards
  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          TextField( 
            // register the value stored when the text field with flutter changes
            controller: _titleController ,
            maxLength: 50,
            decoration: const InputDecoration(
              label: Text('Title')
            ),
            
          ),
          Row(
            children: [
              ElevatedButton(
                onPressed: () {
                   print(_titleController.text);
                }, 
                child: const Text('Save Expense'),
                )
            ],
          )
        ],
      ),
      );
  }
}