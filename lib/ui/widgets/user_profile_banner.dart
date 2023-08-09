import 'package:flutter/material.dart';

class UserProfileBanner extends StatelessWidget {
  const UserProfileBanner({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 16),
      tileColor: Colors.green,
      leading: CircleAvatar(
        backgroundImage: NetworkImage("https://pbs.twimg.com/profile_images/1674815862879178752/nTGMV1Eo_400x400.jpg"),
        radius: 15,
      ),
      title: Text('User Name', style: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold
      ),),
      subtitle: Text('User email',style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold
      ),),
    );
  }
}
