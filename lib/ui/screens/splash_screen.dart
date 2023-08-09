
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mytaskmanager/data/models/auth_utility.dart';
import 'package:mytaskmanager/ui/screens/bottom_nav_base_screen.dart';
import 'package:mytaskmanager/ui/screens/login_screen.dart';
import 'package:mytaskmanager/ui/utils/assets_utils.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    navigateToLogin();
  }

  void navigateToLogin(){
    Future.delayed(Duration(seconds: 5)).then((_) async {
      final bool isLoggedIn=await AuthUtility.checkUserLoggedIn();
      if(mounted){
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => isLoggedIn? BottomNavBaseScreen(): const LoginScreen()),
            (route) => false);
      }
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: SvgPicture.asset(AssetsUtils.backgroundSVG,fit: BoxFit.fitHeight,),
          ),
          Center(
            child: SvgPicture.asset(AssetsUtils.logoSVG, width: 80, fit: BoxFit.scaleDown ,),
          ),
        ],
      ),

    );
  }
}
