

import 'package:flutter/material.dart';
import 'package:platnova_expense_tracker_app/widgets/expenses_list/expenses_list.dart';
import 'package:platnova_expense_tracker_app/models/expense.dart';
import 'package:platnova_expense_tracker_app/widgets/new_expense.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
   final List<Expense> _registeredExpenses = [
    Expense(
      title: 'netflix', 
      amount: 30000, 
      date: DateTime.now(), 
      category: Category.leisure
      ),
      Expense(
      title: 'allowance', 
      amount: 50000, 
      date: DateTime.now(), 
      category: Category.food,
      ),
      Expense(
      title: 'shortlet', 
      amount: 30000, 
      date: DateTime.now(), 
      category: Category.travel
      ),
      Expense(
      title: 'fuel', 
      amount: 30000, 
      date: DateTime.now(), 
      category: Category.work
      ),
      ];

      void _openAddExpenseOverlay() {
        showModalBottomSheet(
          isScrollControlled: true, // make sure the keyboard doesnt obscure the form
          context: context, 
          builder:(ctx) =>  NewExpense(onAddExpense: _addExpense),
          );
      }

      // add exense
      void _addExpense(Expense expense) {
        setState(() {
          _registeredExpenses.add(expense);
        });
      }

      //remove expense
      void _removeExpense(Expense expense) {
        setState(() {
          _registeredExpenses.remove(expense);
        });
      }


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text("Platnova Expense Tracker"),
        actions: [
          IconButton(
            onPressed: _openAddExpenseOverlay, 
            icon: const Icon(Icons.add),
            ),
        ],
      ),
      body: Column(
        children: [
          const Text('The chart'),
          Expanded(
            child: ExpensesList(
              expenses: _registeredExpenses,
              onRemoveExpense: _removeExpense, //pass removeExpense as a value 
              ),
              ),
        ],
      ),
    );
  }
}

// expenses displays a column inside a column , youll run into problems, wrap with Expanded()