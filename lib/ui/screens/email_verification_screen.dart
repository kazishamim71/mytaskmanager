import 'package:flutter/material.dart';
import 'package:mytaskmanager/ui/screens/login_screen.dart';
import 'package:mytaskmanager/ui/screens/otp_verification_screen.dart';
import 'package:mytaskmanager/ui/widgets/screen_background.dart';

class EmailVerificationScreen extends StatelessWidget {
  const EmailVerificationScreen({super.key});

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
                  'Email Verification',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.w500),
                ),
                Text('A 6 Digit OTP will be sent to your email',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.grey),),
                const SizedBox(height: 10,),
                TextField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: 'Email',

                  ),
                ),

                SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>OtpVerificationScreen()));
                    }, child: Icon(Icons.arrow_forward_ios))),
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
