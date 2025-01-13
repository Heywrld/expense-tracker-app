import 'package:flutter/material.dart';
import 'package:platnova_expense_tracker_app/models/expense.dart';

class ExpenseItem extends StatelessWidget {
  const ExpenseItem( this.expense, {super.key});

  final Expense expense;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, //makes sure the title in the column starts from the left
          children: [
            Text(
              expense.title,
              style: Theme.of(context).textTheme.titleLarge, // access the theme styling for title large
              ),
            const SizedBox(height: 4,),
            Row(
              children: [
                Text('\$${expense.amount.toStringAsFixed(2)}'), // covert to 2dp
                  const Spacer(),
                Row(
                  children: [
                    Icon(categoryIcons[expense.category]),
                    const SizedBox(width: 8,),
                    Text(expense.formattedDate),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}