import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:todo_app/utils/constants/color_constants.dart';
import 'package:todo_app/utils/constants/image_constants.dart';
import 'package:todo_app/view/dummydb.dart';
import 'package:todo_app/view/home_screen/tabs/appbar_dropdown_rowcard.dart';
import 'package:todo_app/view/list_adding_screen/list_adding_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? dropValue;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: ColorConstants.violetlight,
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ListAddingScreen(),
                ));
          },
          child: Icon(
            Icons.add,
            color: ColorConstants.whiteMain,
            weight: 20,
            size: 46,
          ),
        ),
        backgroundColor: ColorConstants.whiteMain,
        body: Column(
          children: [
            Container(
              width: double.infinity,
              height: 70,
              decoration: BoxDecoration(
                  color: ColorConstants.violetApp,
                  boxShadow: [
                    BoxShadow(blurRadius: 3, offset: Offset(1.5, 3))
                  ]),
              child: Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.check_circle,
                    color: ColorConstants.whiteMain,
                    size: 35,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  DropdownButton(
                    iconEnabledColor: ColorConstants.whiteMain,
                    hint: Text(
                      'All Lists',
                      style: TextStyle(
                          color: ColorConstants.whiteMain,
                          fontSize: 23,
                          fontWeight: FontWeight.bold),
                    ),
                    value: dropValue,
                    dropdownColor: ColorConstants.violetlight,
                    items: List.generate(
                      Dummydb.dropdownData.length,
                      (index) => DropdownMenuItem(
                          value: Dummydb.dropdownData[index],
                          child: AppbarDropdownRowcard(
                            name: Dummydb.dropdownData[index],
                          )),
                    ),
                    onChanged: (value) {
                      setState(() {
                        dropValue = value! as String?;
                      });
                    },
                  ),
                  SizedBox(
                    width: 40,
                  ),
                  CircleAvatar(
                    radius: 20,
                    backgroundImage: AssetImage(ImageConstants.dp1),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Icon(
                    Icons.more_vert,
                    size: 35,
                    color: ColorConstants.whiteMain,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
