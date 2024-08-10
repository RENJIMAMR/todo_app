import 'package:flutter/material.dart';
import 'package:todo_app/utils/constants/color_constants.dart';
import 'package:todo_app/view/home_screen/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorConstants.violetApp,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              'Welcome to..',
              style: TextStyle(
                  color: ColorConstants.whiteMain,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              "' TickTask '",
              style: TextStyle(
                  color: ColorConstants.whiteMain,
                  fontSize: 40,
                  fontWeight: FontWeight.w900),
            ),
            SizedBox(
              height: 150,
            ),
            Container(
              height: 400,
              decoration: BoxDecoration(
                  color: ColorConstants.whiteMain,
                  borderRadius:
                      BorderRadius.only(topLeft: Radius.circular(80))),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          hintText: 'Enter Username',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(
                                  color: ColorConstants.violetlight))),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          hintText: 'Enter Password',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(
                                  color: ColorConstants.violetlight))),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    ElevatedButton(
                        style: ButtonStyle(
                            maximumSize: WidgetStatePropertyAll(Size(300, 59)),
                            minimumSize: WidgetStatePropertyAll(Size(200, 59)),
                            backgroundColor: WidgetStatePropertyAll(
                                ColorConstants.violetApp)),
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HomeScreen(),
                              ));
                        },
                        child: Text(
                          'Login',
                          style: TextStyle(
                              color: ColorConstants.whiteMain,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ))
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
