import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todo_app/utils/app_sessions.dart';
import 'package:todo_app/utils/constants/color_constants.dart';
import 'package:todo_app/view/dummydb.dart';
import 'package:todo_app/view/home_screen/widgets/appbar_dropdown_rowcard.dart';

class ListAddingScreen extends StatefulWidget {
  const ListAddingScreen({super.key, this.dropValue, this.itemIndex = 0});
  final String? dropValue;
  final int itemIndex;
  @override
  State<ListAddingScreen> createState() => _ListAddingScreenState();
}

class _ListAddingScreenState extends State<ListAddingScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  bool isEdit = false;

  var listBox = Hive.box(AppSessions.ListBox);
  List listKeys = [];

  @override
  void initState() {
    listKeys = listBox.keys.toList();
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstants.whiteMain,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            //for editing list adding screen data

            // isEdit
            //     ? listBox.put(listKeys[widget.itemIndex!], {
            //         'taskName': nameController.text,
            //         'dueDate': dateController.text
            //       })
            //     :
            listBox.add({
              'taskName': nameController.text,
              'dueDate': dateController.text
            });
            listKeys = listBox.keys.toList();
            setState(() {});
            Navigator.pop(context);
          },
          backgroundColor: ColorConstants.whiteMain,
          child: Icon(Icons.check),
        ),
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
                child: Row(children: [
                  SizedBox(
                    width: 10,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back,
                      color: ColorConstants.whiteMain,
                      size: 30,
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    'New Task',
                    style: TextStyle(
                        color: ColorConstants.whiteMain,
                        fontSize: 23,
                        fontWeight: FontWeight.bold),
                  ),
                ])),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    'What is to be done?',
                    style: TextStyle(
                        color: ColorConstants.violetApp,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                  TextField(
                    controller: nameController,
                    style: TextStyle(color: ColorConstants.blackMain),
                    decoration: InputDecoration(
                        hintText: 'Enter Task Here',
                        hintStyle: TextStyle(
                            color: ColorConstants.greyMain.withOpacity(.9))),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Text(
                    'Due date',
                    style: TextStyle(
                        color: ColorConstants.violetApp,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                  TextField(
                    controller: dateController,
                    readOnly: true,
                    style: TextStyle(color: ColorConstants.blackMain),
                    decoration: InputDecoration(
                        suffixIcon: InkWell(
                          onTap: () {
                            showDatePicker(
                                context: context,
                                firstDate: DateTime(2024),
                                lastDate: DateTime.now());
                          },
                          child: Icon(
                            Icons.calendar_month_sharp,
                            size: 30,
                            color: ColorConstants.blackMain,
                          ),
                        ),
                        hintText: 'Date not set',
                        hintStyle: TextStyle(
                            color: ColorConstants.greyMain.withOpacity(.9))),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Text(
                    'Add to List',
                    style: TextStyle(
                        color: ColorConstants.whiteMain,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                  DropdownButton(
                    iconEnabledColor: ColorConstants.blackMain,
                    hint: Text(
                      'Default',
                      style: TextStyle(
                          color: ColorConstants.blackMain,
                          fontSize: 23,
                          fontWeight: FontWeight.bold),
                    ),
                    value: widget.dropValue,
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
                        widget.dropValue == value! as String?;
                      });
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
