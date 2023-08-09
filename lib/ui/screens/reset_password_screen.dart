import 'package:flutter/material.dart';
import 'package:mytaskmanager/ui/screens/login_screen.dart';
import 'package:mytaskmanager/ui/screens/otp_verification_screen.dart';
import 'package:mytaskmanager/ui/widgets/screen_background.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBackground(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 50,),
                const Text(
                  'Reset Password',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.w500),
                ),
                Text('Enter new password with minimum 8 characters',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.grey),),
                const SizedBox(height: 10,),
                TextField(
                  obscureText: true,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(

                    hintText: 'New Password',

                  ),
                ),
                TextField(
                  keyboardType: TextInputType.text,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Confirm Password',

                  ),
                ),

                SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>OtpVerificationScreen()));
                    }, child: Text('Confirm'))),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [

                    Center(child: Text("Have an account?")),
                    TextButton(onPressed: () {
                     // Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
                      Navigator.pop(context);
                    }, child: Text('Sign In')),
                  ],
                )


              ],
            ),
          ),
        ),
      ),
    );
  }
}
