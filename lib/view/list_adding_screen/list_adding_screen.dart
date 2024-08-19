import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/utils/app_sessions.dart';
import 'package:todo_app/utils/constants/color_constants.dart';
import 'package:todo_app/view/dummydb.dart';
import 'package:todo_app/view/home_screen/home_screen.dart';
import 'package:todo_app/view/home_screen/widgets/appbar_dropdown_rowcard.dart';
import 'package:todo_app/view/list_adding_screen/widgets/dropdown_row_card.dart';

class ListAddingScreen extends StatefulWidget {
  const ListAddingScreen({
    super.key,
    this.itemIndex = 0,
    this.isEdit = false,
    this.isCompleted = false,
    this.taskname,
    this.dueDate,
    this.time,
    this.dropValue,
    this.isRepeat,
    this.dropTime,
  });

  final int itemIndex;
  final bool isEdit;
  final bool isCompleted;
  final bool? isRepeat;
  final String? taskname, dueDate, time, dropValue, dropTime;
  @override
  State<ListAddingScreen> createState() => _ListAddingScreenState();
}

class _ListAddingScreenState extends State<ListAddingScreen> {
  String? dropValue1, dropTime1;
  bool isRepeat = false;
  TextEditingController nameController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController timeController = TextEditingController();

  var listBox = Hive.box(AppSessions.ListBox);
  List listKeys = [];

  @override
  void initState() {
    if (widget.isEdit) {
      listKeys = listBox.keys.toList();
      nameController.text = widget.taskname ?? '';
      dateController.text = widget.dueDate ?? '';
      timeController.text = widget.time ?? '';
      dropValue1 = widget.dropValue;
      dropTime1 = widget.dropTime;
    }

    setState(() {});
    print(listKeys);
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

            widget.isEdit == true
                ? listBox.put(listKeys[widget.itemIndex], {
                    'taskName': nameController.text,
                    'dueDate': dateController.text,
                    'time': timeController.text,
                    'isCompleted': widget.isCompleted,
                    'dropValue': dropValue1,
                    'isRepeat': isRepeat,
                    'dropTime': dropTime1
                  })
                : listBox.add({
                    'taskName': nameController.text,
                    'dueDate': dateController.text,
                    'time': timeController.text,
                    'isCompleted': false,
                    'dropValue': dropValue1,
                    'isRepeat': isRepeat,
                    'dropTime': dropTime1
                  });

            setState(() {});
            //to pass the state of this screen to home screen navigator push
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => HomeScreen(),
                ));
          },
          backgroundColor: ColorConstants.violetlight,
          child: Icon(
            Icons.check,
            color: ColorConstants.whiteMain,
            weight: 30,
            size: 40,
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
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

                    SizedBox(
                      height: 20,
                    ),
                    TextField(
                      controller: dateController,
                      readOnly: true,
                      style: TextStyle(color: ColorConstants.blackMain),
                      decoration: InputDecoration(
                          suffixIcon: InkWell(
                            onTap: () async {
                              var selectDate = await showDatePicker(
                                  initialDatePickerMode: DatePickerMode.day,
                                  context: context,
                                  firstDate: DateTime.now(),
                                  lastDate: DateTime(2025),
                                  initialDate: DateTime.now());

                              if (selectDate != null) {
                                dateController.text =
                                    DateFormat('dd MMMM, y').format(selectDate);

                                // Show time field after selecting the date
                                // timeController.text =
                                //     ''; // Clear the previous time
                                setState(() {});
                              }
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
                      height: 20,
                    ),
                    // TextField for selecting time
                    if (dateController.text.isNotEmpty)
                      TextField(
                        controller: timeController,
                        readOnly: true,
                        style: TextStyle(color: ColorConstants.blackMain),
                        decoration: InputDecoration(
                          hintText: 'Select Time',
                          hintStyle: TextStyle(
                            color: ColorConstants.greyMain.withOpacity(.9),
                          ),
                          suffixIcon: InkWell(
                            onTap: () async {
                              var selectTime = await showTimePicker(
                                context: context,
                                initialTime: TimeOfDay.now(),
                              );

                              if (selectTime != null) {
                                final now = DateTime.now();
                                final selectedDateTime = DateTime(
                                  now.year,
                                  now.month,
                                  now.day,
                                  selectTime.hour,
                                  selectTime.minute,
                                );
                                timeController.text = DateFormat('hh:mm a')
                                    .format(selectedDateTime);
                                // dropTime = '';
                                setState(() {});
                              }
                            },
                            child: Icon(
                              Icons.alarm,
                              size: 30,
                              color: ColorConstants.blackMain,
                            ),
                          ),
                        ),
                      ),
                    SizedBox(
                      height: 30,
                    ),

                    timeController.text.isNotEmpty
                        ? Text(
                            'Repeat',
                            style: TextStyle(
                                color: ColorConstants.blackMain,
                                fontSize: 22,
                                fontWeight: FontWeight.bold),
                          )
                        : SizedBox(),

                    timeController.text.isNotEmpty
                        ? DropdownButton(
                            style: TextStyle(color: ColorConstants.blackMain),
                            // focusColor: ColorConstants.blackMain,
                            iconEnabledColor: ColorConstants.blackMain,
                            hint: Text(
                              'No Repeat',
                              style: TextStyle(
                                color: ColorConstants.blackMain,
                                fontSize: 20,
                              ),
                            ),
                            value: dropTime1,

                            dropdownColor: ColorConstants.whiteMain,
                            items: [
                              DropdownMenuItem(
                                  value: 'Once a Day',
                                  child: Text(
                                    'Once a Day',
                                  )),
                              DropdownMenuItem(
                                  value: 'Once a week',
                                  child: Text(
                                    'Once a week',
                                  )),
                              DropdownMenuItem(
                                  value: 'Once a month',
                                  child: Text(
                                    'Once a month',
                                  )),
                              DropdownMenuItem(
                                  value: 'Once a year',
                                  child: Text(
                                    'Once a year',
                                  ))
                            ],
                            onChanged: (value) {
                              setState(() {
                                dropTime1 = value!;
                                isRepeat = true;
                              });
                            },
                          )
                        : SizedBox(),

                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      'Add to List',
                      style: TextStyle(
                          color: ColorConstants.blackMain,
                          fontSize: 22,
                          fontWeight: FontWeight.bold),
                    ),
                    DropdownButton(
                      style: TextStyle(color: ColorConstants.blackMain),
                      // focusColor: ColorConstants.blackMain,
                      iconEnabledColor: ColorConstants.blackMain,
                      hint: Text(
                        'Default',
                        style: TextStyle(
                          color: ColorConstants.blackMain,
                          fontSize: 20,
                        ),
                      ),
                      value: dropValue1,

                      dropdownColor: ColorConstants.whiteMain,
                      items: List.generate(
                        Dummydb.dropdownData.length,
                        (index) => DropdownMenuItem(
                            value: Dummydb.dropdownData[index],
                            child: DropdownRowcard(
                              name: Dummydb.dropdownData[index],
                            )),
                      ),
                      onChanged: (value) {
                        setState(() {
                          dropValue1 = value! as String;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
