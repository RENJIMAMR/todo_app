import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todo_app/utils/app_sessions.dart';
import 'package:todo_app/utils/constants/color_constants.dart';
import 'package:todo_app/utils/constants/image_constants.dart';
import 'package:todo_app/view/dummydb.dart';
import 'package:todo_app/view/home_screen/widgets/appbar_dropdown_rowcard.dart';
import 'package:todo_app/view/home_screen/widgets/list_row_card.dart';
import 'package:todo_app/view/list_adding_screen/list_adding_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? dropValue;
  int selectedIndex = 0;
  var listBox = Hive.box(AppSessions.ListBox);
  List listKeys = [];

  @override
  void initState() {
    listKeys = listBox.keys.toList();
    setState(() {});
    print(listKeys);
    super.initState();
  }

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
                  builder: (context) => ListAddingScreen(
                      // itemIndex: selectedIndex,

                      ),
                ));
            listKeys = listBox.keys.toList();
            setState(() {});
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
          crossAxisAlignment: CrossAxisAlignment.start,
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
            ),
            Expanded(
              child: ListView.builder(
                  // reverse: true,
                  padding: EdgeInsets.all(20),
                  itemCount: listKeys.length,
                  itemBuilder: (context, index) {
                    var currentList = listBox.get(listKeys[index]);
                    // Column(
                    //   crossAxisAlignment: CrossAxisAlignment.start,
                    //   children: [
                    //     Text(
                    //       'ToDay',
                    //       style: TextStyle(
                    //           color: ColorConstants.violetApp,
                    //           fontSize: 20,
                    //           fontWeight: FontWeight.bold),
                    // ),
                    return InkWell(
                        onTap: () {
                          selectedIndex = index;

                          setState(() {});
                        },
                        child: ListRowCard(
                          taskName: currentList['taskName'],
                          duedate: currentList['dueDate'],
                          time: currentList['time'],
                          onDelete: () async {
                            Future.delayed(Duration(seconds: 2)).then((value) {
                              listBox.delete(listKeys[index]);
                              listKeys = listBox.keys.toList();
                              setState(() {});
                            });
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                backgroundColor:
                                    ColorConstants.blackMain.withOpacity(.8),
                                content: Text(
                                  'Task Completed',
                                  style: TextStyle(
                                      color: ColorConstants.whiteMain,
                                      fontSize: 20),
                                )));
                          },
                        ));
                    //   ],
                    // );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
