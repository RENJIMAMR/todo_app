import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app/utils/constants/color_constants.dart';
import 'package:todo_app/view/home_screen/home_screen.dart';
import 'package:todo_app/view/welcome_page/welcome_page.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> _formkey = GlobalKey();
  late final SharedPreferences prefs;

  @override
  void initState() {
    login();

    super.initState();
  }

  login() async {
    prefs = await SharedPreferences.getInstance();
    bool isLoggedIn = await prefs.getBool('isLoggedIn') ?? false;
    if (isLoggedIn) {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => HomeScreen(),
          ));
    }

    setState(() {});
  }

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
                child: Form(
                  key: _formkey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 50,
                      ),
                      TextFormField(
                        controller: usernameController,
                        validator: (value) {
                          if (value != null &&
                              value.isNotEmpty &&
                              (value.contains('@') || value.contains('.in'))) {
                            return null;
                          } else {
                            return "Enter a Valid Email Id";
                          }
                        },
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
                        controller: passwordController,
                        validator: (value) {
                          if (value != null &&
                              value.isNotEmpty &&
                              value.length >= 5 &&
                              value.length <= 12) {
                            return null;
                          } else {
                            return 'Enter a Valid Password';
                          }
                        },
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
                              maximumSize:
                                  WidgetStatePropertyAll(Size(300, 59)),
                              minimumSize:
                                  WidgetStatePropertyAll(Size(200, 59)),
                              backgroundColor: WidgetStatePropertyAll(
                                  ColorConstants.violetApp)),
                          onPressed: () {
                            setState(() async {
                              await prefs.setString(
                                  'uname', usernameController.text);
                              await prefs.setString(
                                  'pass', passwordController.text);
                              await prefs.setBool('isLoggedIn', true);
                              if (_formkey.currentState!.validate()) {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => WelcomePage()));
                              } else {
                                print('Not Validated');
                              }
                            });
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
            ),
          ],
        ));
  }
}
