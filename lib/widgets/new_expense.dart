import 'package:flutter/material.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key});

  @override
  State<NewExpense> createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  // using flutter to store the title text in the text field
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();

// using flutter to dispose the title text in the text field afterwards
  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
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
          TextField( 
            // register the value stored when the text field with flutter changes
            controller: _amountController ,
            // KeyboardType to edit the kind of textinput yo want
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              label: Text('Amount'),
              prefixText: '\$ ',
            ),
            
          ),

          Row(
            children: [
              TextButton(
                onPressed: () {
                  // close off the modal
                  Navigator.pop(context);
                }, 
                child: const Text('Cancel')
                ),
              ElevatedButton(
                onPressed: () {
                   print(_titleController.text);
                   print(_amountController.text);
                }, 
                child: const Text('Save Expense'),
                )
            ],
          ),
        ],
      ),
      );
  }
}