

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
      title: 'short let',
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
          isScrollControlled: true, // make sure the keyboard doesn't obscure the form
          context: context, 
          builder:(ctx) =>  NewExpense(onAddExpense: _addExpense),
          );
      }

      // add expense
      void _addExpense(Expense expense) {

        setState(() {
          _registeredExpenses.add(expense);
        });
      }

      //remove expense
      void _removeExpense(Expense expense) {
        final expenseIndex = _registeredExpenses.indexOf(expense); // store the initial position of the swiped expense

        setState(() {
          _registeredExpenses.remove(expense);
        });

        ScaffoldMessenger.of(context).clearSnackBars(); // clears old message and immediately shows the new one
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                duration: const Duration(seconds: 3),
                content: const Text('Expense deleted'),
                action: SnackBarAction(
                    label: 'Undo',
                    onPressed: () {
                      setState(() {
                        _registeredExpenses.insert(expenseIndex, expense);
                      });

                    },
                ),
            ), // display  a message anytime you swipe out an expense to show if you want to undo
        );
      }


  @override
  Widget build(BuildContext context) {
    Widget mainContent = const Center(
      child: Text('No expense found. Start adding some!'),
    ); //store main content as a widget 
    
    if (_registeredExpenses.isNotEmpty) {
      mainContent = ExpensesList(
              expenses: _registeredExpenses,
              onRemoveExpense: _removeExpense, //pass removeExpense as a value 
              );
    } // if the registered Expenses is not empty , then the main content should display the expenses list


    return  Scaffold(
      appBar: AppBar(        
        leading: Container(
          padding: const EdgeInsets.fromLTRB(25, 0, 0, 0),
          child: Image.asset(
            'assets/images/logo-white.png',
            width: 300,
            height: 200,
            ),
        ),
        //title: const Text("Platnova Expense Tracker"),
        actions: [
          IconButton(
            onPressed: _openAddExpenseOverlay, 
            icon: const Icon(Icons.add, color: Colors.white,),
            ),
        ],
      ),
      body: Column(
        children: [
          const Text('The chart'),
          Expanded(
            child: mainContent,
              ),
        ],
      ),
    );
  }
}

// expenses displays a column inside a column , you will run into problems, wrap with Expanded()