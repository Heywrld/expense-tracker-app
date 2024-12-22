import 'package:flutter/material.dart';
import 'package:platnova_expense_tracker_app/models/expense.dart';
import 'package:platnova_expense_tracker_app/widgets/expenses_list/expense_item.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({super.key, required this.expenses,});

  final List<Expense> expenses;


  // use ListView(), ListView.builder when you have a list of unknown length that could potentially increase instead of using Column()
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length, 
      itemBuilder: (ctx, index) => ExpenseItem(expenses[index]),
      
      ) ;
  }
}