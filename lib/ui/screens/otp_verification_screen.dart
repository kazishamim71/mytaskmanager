import 'package:flutter/material.dart';
import 'package:mytaskmanager/ui/screens/login_screen.dart';
import 'package:mytaskmanager/ui/screens/reset_password_screen.dart';
import 'package:mytaskmanager/ui/widgets/screen_background.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpVerificationScreen extends StatelessWidget {
  const OtpVerificationScreen({super.key});

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
                  'Enter OTP here',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.w500),
                ),
                Text('OTP must 6 digits',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.grey),),
                const SizedBox(height: 10,),
                PinCodeTextField(
                  length: 6,
                  obscureText: false,
                  animationType: AnimationType.fade,
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(5),
                    fieldHeight: 50,
                    fieldWidth: 40,
                  //  activeFillColor: Colors.white,
                    activeColor: Colors.white,
                    inactiveFillColor: Colors.white,
                    inactiveColor: Colors.white,
                    selectedColor: Colors.white,
                    selectedFillColor: Colors.white,
                    activeFillColor: Colors.white,


                  ),
                  animationDuration: Duration(milliseconds: 300),
                  enablePinAutofill: true,

                  backgroundColor: Colors.white,
                  enableActiveFill: true,
                  cursorColor: Colors.green,
                //  errorAnimationController: errorController,
                 // controller: textEditingController,
                  onCompleted: (v) {
                    print("Completed");
                  },
                  onChanged: (value) {
                    /*print(value);
                    setState(() {
                      currentText = value;
                    });*/
                  },
                  beforeTextPaste: (text) {
                    print("Allowing to paste $text");
                    //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                    //but you can show anything you want here, like your pop up saying wrong paste format or etc
                    return true;
                  }, appContext: context,
                ),
               
               /* TextField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: 'OTP Code',

                  ),
                ),*/

                SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(onPressed: () {
                      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>ResetPasswordScreen()), (route) => false);
                    }, child: const Text('Verify'))),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [

                    Center(child: const Text("Have an account?")),
                    TextButton(onPressed: () {
                      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>LoginScreen()), (route) => false);

                      // Navigator.pop(context);
                    }, child: const Text('Sign In')),
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
