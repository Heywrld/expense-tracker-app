import 'package:flutter/material.dart';
import 'package:platnova_expense_tracker_app/models/expense.dart';
import 'package:platnova_expense_tracker_app/widgets/expenses_list/expense_item.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({
    super.key, 
    required this.expenses,
    required this.onRemoveExpense,
    });

  final List<Expense> expenses;
  final void Function(Expense expense) onRemoveExpense; // accept this function as an input


  // use ListView(), ListView.builder when you have a list of unknown length that could potentially increase instead of using Column()
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length, 
      itemBuilder: (ctx, index) => 
      Dismissible(
        key: ValueKey(expenses[index]), 
        onDismissed: (direction) {
          onRemoveExpense(expenses[index]);
        }, // allows you to trigger a function whenever one widget has been swipped away
        child: 
        ExpenseItem(
          expenses[index],
          ),
      ), //dismiss the saved expenses when being swiped
      
      ) ;
  }
}