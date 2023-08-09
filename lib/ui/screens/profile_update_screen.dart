import 'package:flutter/material.dart';
import 'package:mytaskmanager/ui/widgets/screen_background.dart';
import '../widgets/summary_card.dart';
import '../widgets/task_list_tile.dart';
import '../widgets/user_profile_banner.dart';

class ProfileUpdateScreen extends StatelessWidget {
  const ProfileUpdateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           const UserProfileBanner(),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 25,),
                    Text('Update Profile', style: Theme.of(context).textTheme.titleLarge,),
                    SizedBox(height: 5,),
                    TextFormField(
                      
                      decoration: InputDecoration(
                        hintText: 'Profile Image',
                      ),
                    ),
                    SizedBox(height: 5,),
                    TextFormField(
                      maxLines: 5,
                      decoration: InputDecoration(
                        hintText: 'Description',
                      ),
                    ),
                    SizedBox(height: 10,),
                    SizedBox(

                        width: double.infinity,
                        child: ElevatedButton(onPressed: () {
                         // Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>BottomNavBaseScreen()), (route) => false);
                        }, child: Icon(Icons.arrow_forward_ios))),
                  ],
                ),
              ),
            ),



          ],
        ),

      ),

    );
  }
}





