import 'package:flutter/material.dart';

class TaskListTile extends StatelessWidget {
  const TaskListTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text('Title will be here'),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Description here'),
          Text('Date : 01/01/2023'),
          Row(
            children: [
              Chip(label: Text('New', style: TextStyle(color: Colors.white),), backgroundColor: Colors.green,),
              Spacer(),
              IconButton(onPressed: (){}, icon: Icon(Icons.delete_forever, color: Colors.red,)),
              IconButton(onPressed: (){}, icon: Icon(Icons.edit,color: Colors.greenAccent,)),
            ],
          )

        ],
      ),
    );
  }
}