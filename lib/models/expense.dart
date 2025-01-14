// explain which kind of structure it will have 

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

final formatter = DateFormat.yMd(); // defines how the data will be formatted through intl package

const uuid = Uuid();

enum Category { food, travel , leisure, work }

  const categoryIcons = {
    Category.food: Icons.lunch_dining,
    Category.travel: Icons.flight_takeoff,
    Category.leisure: Icons.movie,
    Category.work: Icons.work,
  };

class Expense {
  Expense({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  }) : id = uuid.v4();

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  String get formattedDate {
    return formatter.format(date);
  }
  
}

// expense bucket, we need multiple buckets for each category, so that we can sum all the expenses for that category and display them as chart
class ExpenseBucket {
  const ExpenseBucket({
    required this.category,
    required this.expenses,
  });

  //add my own alternative named constructor function

  ExpenseBucket.forCategory(List<Expense> allExpenses, this.category) 
  : expenses = allExpenses
  .where((expense) => expense.category == category)
  .toList() ;


  final Category category;
  final List<Expense> expenses;

  // get the total expenses
  double get totalExpenses {
    double sum = 0;

    for (final expense in expenses) {
      sum += expense.amount; // sum =sum + expense.amount
    } //for in loop

    return sum;
  }
}