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

  // setting the date picker
  void _presentDatePicker() {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);
    showDatePicker(
      context: context, 
      initialDate: now,
      firstDate: firstDate,  
      lastDate: now,
      );
  }

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
          Row(
            children: [
              Expanded(
                child: TextField( 
                // register the value stored when the text field with flutter changes
                controller: _amountController ,
                // KeyboardType to edit the kind of textinput yo want
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  prefixText: '\$ ',
                  label: Text('Amount'),
                ),
              ), 
                ),
              
              const SizedBox(width: 16,),
              
               Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                     const Text('Selected Date'),
                     IconButton(
                      onPressed: _presentDatePicker, 
                      icon: const Icon(
                        Icons.calendar_month,
                      )
                      )
                ],
              ),
              ),
              ],
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