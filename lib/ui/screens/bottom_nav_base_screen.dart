import 'package:flutter/material.dart';
import 'package:mytaskmanager/ui/screens/cancelled_task_screen.dart';
import 'package:mytaskmanager/ui/screens/done_task_screen.dart';
import 'package:mytaskmanager/ui/screens/inprogress_task_screen.dart';
import 'package:mytaskmanager/ui/screens/new_task_screen.dart';

class BottomNavBaseScreen extends StatefulWidget {
  const BottomNavBaseScreen({super.key});

  @override
  State<BottomNavBaseScreen> createState() => _BottomNavBaseScreenState();
}

class _BottomNavBaseScreenState extends State<BottomNavBaseScreen> {
  int _selectedScreenIndex=0;

  final List<Widget> _screen=const [
    NewTaskScreen(),
    InProgressTaskScreen(),
    CancelledTaskScreen(),
    DoneTaskScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screen[_selectedScreenIndex],
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.grey,
        unselectedLabelStyle: TextStyle(
          color: Colors.grey,
        ),
        showUnselectedLabels: true,
        selectedItemColor: Colors.green,
        currentIndex: _selectedScreenIndex,
        onTap: (int index){
          _selectedScreenIndex=index;
          if(mounted){
            setState(() {

            });
          }
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.create),label: 'New'),
          BottomNavigationBarItem(icon: Icon(Icons.access_time_filled_outlined),label: 'In Progress'),
          BottomNavigationBarItem(icon: Icon(Icons.cancel_outlined),label: 'Cancel'),
          BottomNavigationBarItem(icon: Icon(Icons.done),label: 'Done'),

        ],
      ),
    );
  }
}
