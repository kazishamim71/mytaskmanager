import 'package:flutter/material.dart';
import 'package:mytaskmanager/data/models/network_response.dart';
import 'package:mytaskmanager/data/service/network_caller.dart';
import 'package:mytaskmanager/ui/utils/urls.dart';
import '../widgets/screen_background.dart';
import 'email_verification_screen.dart';
import 'login_screen.dart';


class SignupScreen extends StatefulWidget {
   SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _emailTEController=TextEditingController();
  final TextEditingController _firstNameTEController=TextEditingController();
  final TextEditingController _lastNameTEController=TextEditingController();
  final TextEditingController _mobileTEController=TextEditingController();
  final TextEditingController _passwordTEController=TextEditingController();
  final GlobalKey<FormState> _formKey=GlobalKey<FormState>();

  bool _signUpInProgress=false;

  Future<void> userSignUp() async {
    _signUpInProgress=true;
    if(mounted){
      setState(() {

      });
    }
    final NetworkResponse response= await NetworkCaller().postRequest(Urls.registration, <String, dynamic>{

      "email": _emailTEController.text.trim(),
      "firstName": _firstNameTEController.text.trim() ,
      "lastName": _lastNameTEController.text.trim(),
      "mobile": _mobileTEController.text.trim(),
      "password": _passwordTEController.text.trim(),
      "photo": "",

    });
    _signUpInProgress=false;
    if(mounted){
      setState(() {

      });
    }
    if(response.isSuccess){
      _emailTEController.clear();
      _firstNameTEController.clear();
      _lastNameTEController.clear();
      _mobileTEController.clear();
      _passwordTEController.clear();
      if(mounted){
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Registration Successful')));
      }
    }else{
      if(mounted){
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Registration failed!')));
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
                      'Join With Us',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: 10,),
                    TextFormField(
                      controller: _emailTEController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        hintText: 'Email',


                      ),
                      validator: (String? value){
                        if(value?.isEmpty ?? true){
                          return 'Enter your email';
                        }
                      },
                    ),
                    const SizedBox(height: 10,),
                    TextFormField(
                      controller: _firstNameTEController,
                      decoration: InputDecoration(
                        hintText: 'First Name',

                      ),
                      validator: (String? value){
                        if(value?.isEmpty ?? true){
                          return 'Enter your first name';
                        }
                      },
                    ),
                    const SizedBox(height: 10,),
                    TextFormField(
                      controller: _lastNameTEController,
                      decoration: InputDecoration(
                        hintText: 'Last Name',

                      ),
                      validator: (String? value){
                        if(value?.isEmpty ?? true){
                          return 'Enter your last name';
                        }
                      },
                    ),
                    const SizedBox(height: 10,),
                    TextFormField(
                      controller: _mobileTEController,
                      decoration: InputDecoration(
                        hintText: 'Mobile',

                      ),
                      validator: (String? value){
                        if((value?.isEmpty ?? true) || value!.length<11){
                          return 'Enter your valid mobile number';
                        }
                      },
                    ),
                    const SizedBox(height: 16,),
                    TextFormField(
                      controller: _passwordTEController,
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: 'Password',
                        suffixIcon: Icon(Icons.visibility),

                      ),
                      validator: (String? value){
                        if((value?.isEmpty ?? true) || value!.length<=5 ){
                          return 'Enter your password more than 5 characters';
                        }
                      },
                    ),
                    const SizedBox(height: 25,),
                    SizedBox(
                        width: double.infinity,
                        child: Visibility(
                          visible: _signUpInProgress==false,
                          replacement: const CircularProgressIndicator(),
                          child: ElevatedButton(onPressed: () {
                            userSignUp();
                          }, child: Icon(Icons.arrow_forward_ios)),
                        )),
                    Center(child: TextButton(onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>const EmailVerificationScreen()));
                    }, child: Text('Forgot Password', style: TextStyle(
                        color: Colors.grey
                    ),))),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,

                      children: [

                        Center(child: Text("Have an account?")),
                        TextButton(onPressed: () {
                          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>LoginScreen()), (route) => false);
                        }, child: Text('Sign In')),
                      ],
                    )
                  ],
                ),
              ),
            )));
  }
}



