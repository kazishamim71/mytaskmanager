import 'package:flutter/material.dart';

import '../widgets/task_list_tile.dart';
import '../widgets/user_profile_banner.dart';

class DoneTaskScreen extends StatelessWidget {
  const DoneTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body: SafeArea(
          child: Column(
            children: [
              const UserProfileBanner(),
              /*Row(
                children: [
                  Expanded(child: SummaryCard(taskCount: 125, subTitle: 'New',)),
                  Expanded(child: SummaryCard(taskCount: 225, subTitle: 'In Progress',)),
                  Expanded(child: SummaryCard(taskCount: 325, subTitle: 'Cancelled',)),
                  Expanded(child: SummaryCard(taskCount: 525, subTitle: 'Done',))

                ],
              ),*/
              Expanded(child: ListView.separated(
                itemCount: 20,
                itemBuilder: (context, index){
                  return TaskListTile();
                }, separatorBuilder: (BuildContext context, int index) {
                return const Divider(height: 4,);
              },))
            ],
          ),
        )
    );
  }
}
