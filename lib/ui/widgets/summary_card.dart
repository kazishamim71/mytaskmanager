import 'package:flutter/material.dart';

class SummaryCard extends StatelessWidget {
  const SummaryCard({
    super.key, required this.taskCount,required this.subTitle,
  });
  final int taskCount;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text('$taskCount', style: const TextStyle(
                fontSize: 20,fontWeight: FontWeight.bold
            ),),
            Text(subTitle)
          ],
        ),
      ),
    );
  }
}