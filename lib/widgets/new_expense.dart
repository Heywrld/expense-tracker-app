import 'package:flutter/material.dart';
import 'package:platnova_expense_tracker_app/models/expense.dart';



class NewExpense extends StatefulWidget {
  const NewExpense({super.key});

  @override
  State<NewExpense> createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  // using flutter to store the title text in the text field
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate; //the selected date either stores a value of type  DateTime or null
  Category _selectedCategory = Category.leisure;

  // setting the date picker
  void _presentDatePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);
   final pickedDate = await showDatePicker(
      context: context, 
      initialDate: now,
      firstDate: firstDate,  
      lastDate: now,
      );
      // this line will be execute once the value is available using async, await feature
      setState(() {
        _selectedDate = pickedDate;
      });
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
                     Text(_selectedDate == null ? 'No date selected' : formatter.format(_selectedDate!), ),//display the date dynamically and ! to force it and tell dart that _selectedDate cant be null
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
          const SizedBox(height: 16,),
          Row(
            children: [
              DropdownButton(
                value: _selectedCategory, //display value on screen
                items: Category.values.map(
                  (category) => DropdownMenuItem(
                    value: category,
                    child: Text(category.name.toUpperCase(),
                    ),
                    ),
                    ).toList(), // if showing type iterable error use .toList()
                onChanged: (value) {
                  if (value == null) {
                    return;
                  }
                  setState(() {
                    _selectedCategory = value; //the value was returning null so i had to use the if statement to check it
                  });
                }
                ),
                const Spacer(),
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