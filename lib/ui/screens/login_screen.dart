import 'package:flutter/material.dart';
import 'package:mytaskmanager/data/models/network_response.dart';
import 'package:mytaskmanager/data/service/network_caller.dart';
import 'package:mytaskmanager/ui/screens/bottom_nav_base_screen.dart';
import 'package:mytaskmanager/ui/screens/signup_screen.dart';
import 'package:mytaskmanager/ui/screens/task_screen.dart';
import 'package:mytaskmanager/ui/utils/urls.dart';
import '../widgets/screen_background.dart';
import 'email_verification_screen.dart';


class LoginScreen extends StatefulWidget {



  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailTEController=TextEditingController();
  final TextEditingController _passwordTEController=TextEditingController();

  final GlobalKey<FormState> _formKey=GlobalKey();

  Future<void> login() async{
    Map<String, dynamic> responseBody={
      "email": _emailTEController.text.trim(),
      "password": _passwordTEController.text,
    };

  final NetworkResponse response = await NetworkCaller().postRequest(Urls.login, responseBody);
  if(response.isSuccess){
    if(mounted){
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => BottomNavBaseScreen()),
            (route) => false);
      }
    }else{

    if(mounted){
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Incorrect email or password!')));
    }

  }
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
        body: ScreenBackground(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Get Started With',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: 10,),
                    TextFormField(
                      controller: _emailTEController,
                      decoration: InputDecoration(
                        hintText: 'Email - kazi123@gmail.com',

                      ),
                      validator: (String? value){
                        if(value?.isEmpty ?? true){
                          return 'Enter your email';
                        }
                      },
                    ),
                    const SizedBox(height: 16,),
                    TextFormField(
                      controller: _passwordTEController,
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: 'Password - 123123123',
                        suffixIcon: Icon(Icons.visibility),

                      ),
                      validator: (String? value){
                        if((value?.isEmpty ?? true) || value!.length<=5 ){
                          return 'Enter your password more than 5 characters';
                        }
                      },
                    ),
                    const SizedBox(height: 16,),
                    SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(onPressed: () {
                          login();
                               }, child: Icon(Icons.arrow_forward_ios))),
                    Center(child: TextButton(onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>const EmailVerificationScreen()));
                    }, child: Text('Forgot Password', style: TextStyle(
                        color: Colors.grey
                    ),))),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,

                      children: [

                        Center(child: const Text("Don't have an account?")),
                        TextButton(onPressed: () {
                          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>SignupScreen()), (route) => false);
                        }, child: const Text('Sign Up')),
                      ],
                    )
                  ],
                ),
              ),
            )));
  }
}



