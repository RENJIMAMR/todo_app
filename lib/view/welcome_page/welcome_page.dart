import 'package:flutter/material.dart';
import 'package:todo_app/utils/constants/color_constants.dart';
import 'package:todo_app/utils/constants/image_constants.dart';
import 'package:todo_app/view/home_screen/home_screen.dart';
import 'package:todo_app/view/login_screen/login_screen.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 350,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(ImageConstants.todo_dp),
                  fit: BoxFit.cover)),
        ),
        Center(
          child: Text(
            'The art of project',
            style: TextStyle(
                color: ColorConstants.violetApp,
                fontSize: 43,
                fontWeight: FontWeight.w900),
          ),
        ),
        Center(
          child: Text(
            'management',
            style: TextStyle(
                color: ColorConstants.violetApp,
                fontSize: 43,
                fontWeight: FontWeight.w900),
          ),
        ),
        SizedBox(
          height: 60,
        ),
        ElevatedButton(
            style: ButtonStyle(
                maximumSize: WidgetStatePropertyAll(Size(300, 50)),
                minimumSize: WidgetStatePropertyAll(Size(150, 50)),
                backgroundColor:
                    WidgetStatePropertyAll(ColorConstants.violetlight)),
            onPressed: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginScreen(),
                  ));
            },
            child: Text(
              'Continue',
              style: TextStyle(
                  color: ColorConstants.whiteMain,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ))
      ],
    ));
  }
}
