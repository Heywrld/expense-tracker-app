import 'package:flutter/material.dart';
import 'package:platnova_expense_tracker_app/models/expense.dart';



class NewExpense extends StatefulWidget {
  const NewExpense({super.key, required this.onAddExpense});

  final void Function(Expense expense) onAddExpense;

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

  // validating user input
  void _submitExpenseData () {
    final enteredAmount = double.tryParse(_amountController.text); // convert text to a number and if it cant will be null
    // amountisvalid if entered amount is null or entered amount is less than or equal to 0
    final amountISValid = enteredAmount == null || enteredAmount <= 0;
    if (_titleController.text.trim().isEmpty || amountISValid || _selectedDate == null) {
      //show error message
      showDialog(
        context: context, 
        builder:(ctx) => AlertDialog(
          title: const Text('Invalid input'),
          content: const Text(
            'Please make sure a valid title, amount, date and category was entered.'
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(ctx);
              }, 
              child: const Text('Okay'),
              )
          ],
        ),
        );
        return; // adding return after show dialog inside if statement because i just want to show dialog and do nothing else after
    }

    widget.onAddExpense(
      Expense(
        title: _titleController.text, 
        amount: enteredAmount, 
        date: _selectedDate!, //wont be null, 
        category: _selectedCategory,
        ),
        );
        Navigator.pop(context); //make sure overlay is closed
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
      padding: const EdgeInsets.fromLTRB(16, 48, 16, 16), // style the padding from left, top, right, bottom
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
                // KeyboardType to edit the kind of text input yo want
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
                onPressed: _submitExpenseData,
                child: const Text('Save Expense'),
                )
            ],
          ),
        ],
      ),
      );
  }
}