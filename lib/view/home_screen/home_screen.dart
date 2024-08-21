// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:hive/hive.dart';
// import 'package:share_plus/share_plus.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:todo_app/utils/app_sessions.dart';
// import 'package:todo_app/utils/constants/color_constants.dart';
// import 'package:todo_app/utils/constants/image_constants.dart';
// import 'package:todo_app/view/default_list/default_list.dart';
// import 'package:todo_app/view/dummydb.dart';
// import 'package:todo_app/view/finished_list/finished_list.dart';
// import 'package:todo_app/view/home_screen/widgets/appbar_dropdown_rowcard.dart';
// import 'package:todo_app/view/home_screen/widgets/list_row_card.dart';
// import 'package:todo_app/view/list_adding_screen/list_adding_screen.dart';
// import 'package:todo_app/view/login_screen/login_screen.dart';
// import 'package:todo_app/view/personal_list/personal_list.dart';
// import 'package:todo_app/view/shopping_list/shopping_list.dart';
// import 'package:todo_app/view/wish_list/wish_list.dart';
// import 'package:todo_app/view/work_list/work_list.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   // GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//   String? dropValueH;
//   // int selectedIndex = 0;
//   var listBox = Hive.box(AppSessions.ListBox);
//   List listKeys = [];

//   @override
//   void initState() {
//     listKeys = listBox.keys.toList();
//     setState(() {});
//     print(listKeys);

//     super.initState();
//   }

//   late final SharedPreferences prefs;

//   @override
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         floatingActionButton: FloatingActionButton(
//           backgroundColor: ColorConstants.violetlight,
//           onPressed: () {
//             Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => ListAddingScreen(),
//                 ));
//             listKeys = listBox.keys.toList();
//             setState(() {});
//           },
//           child: Icon(
//             Icons.add,
//             color: ColorConstants.whiteMain,
//             weight: 20,
//             size: 46,
//           ),
//         ),
//         backgroundColor: ColorConstants.whiteMain,
//         body: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Container(
//               width: double.infinity,
//               height: 70,
//               decoration: BoxDecoration(
//                   color: ColorConstants.violetApp,
//                   boxShadow: [
//                     BoxShadow(blurRadius: 3, offset: Offset(1.5, 3))
//                   ]),
//               child: Row(
//                 children: [
//                   SizedBox(
//                     width: 10,
//                   ),
//                   Icon(
//                     Icons.check_circle,
//                     color: ColorConstants.whiteMain,
//                     size: 35,
//                   ),
//                   SizedBox(
//                     width: 20,
//                   ),
//                   DropdownButton(
//                     iconEnabledColor: ColorConstants.whiteMain,
//                     hint: Text(
//                       'All Lists',
//                       style: TextStyle(
//                           color: ColorConstants.whiteMain,
//                           fontSize: 23,
//                           fontWeight: FontWeight.bold),
//                     ),
//                     value: dropValueH ?? Dummydb.dropdownData[0],
//                     dropdownColor: ColorConstants.whiteMain,
//                     items: List.generate(
//                       Dummydb.dropdownData.length,
//                       (index) => DropdownMenuItem(
//                           value: Dummydb.dropdownData[index],
//                           child: AppbarDropdownRowcard(
//                             name: Dummydb.dropdownData[index],
//                           )),
//                     ),
//                     onChanged: (value) {
//                       setState(() {
//                         dropValueH = value! as String?;
//                         if (dropValueH == Dummydb.dropdownData[0]) {
//                           Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (context) => DefaultList(),
//                               ));
//                         } else if (dropValueH == Dummydb.dropdownData[1]) {
//                           Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (context) => PersonalList(),
//                               ));
//                         } else if (dropValueH == Dummydb.dropdownData[2]) {
//                           Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (context) => ShoppingList(),
//                               ));
//                         } else if (dropValueH == Dummydb.dropdownData[3]) {
//                           Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (context) => WishList(),
//                               ));
//                         } else if (dropValueH == Dummydb.dropdownData[4]) {
//                           Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (context) => WorkList(),
//                               ));
//                         } else {
//                           Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (context) => FinishedList(),
//                               ));
//                         }
//                       });
//                     },
//                   ),
//                   Spacer(),
//                   CircleAvatar(
//                     radius: 20,
//                     backgroundImage: AssetImage(ImageConstants.dp1),
//                   ),
//                   SizedBox(
//                     width: 30,
//                   ),
//                   PopupMenuButton(
//                     shadowColor: ColorConstants.violetlight,
//                     iconColor: ColorConstants.whiteMain,
//                     iconSize: 30,
//                     color: ColorConstants.whiteMain,
//                     itemBuilder: (context) => [
//                       PopupMenuItem(
//                           onTap: () async {
//                             await listBox.clear();
//                             listKeys = listBox.keys.toList();
//                             setState(() {});
//                           },
//                           child: Text('Clear')),
//                       PopupMenuItem(child: Text('Settings')),
//                       PopupMenuItem(child: Text('Print')),
//                       PopupMenuItem(
//                           onTap: () async {
//                             final SharedPreferences prefs =
//                                 await SharedPreferences.getInstance();
//                             await prefs.clear();
//                             Navigator.pushReplacement(
//                                 context,
//                                 MaterialPageRoute(
//                                   builder: (context) => LoginScreen(),
//                                 ));
//                             setState(() {});
//                           },
//                           child: Text('Logout'))
//                     ],
//                   )
//                 ],
//               ),
//             ),
//             Expanded(
//               child: ListView.builder(
//                   // reverse: true,
//                   padding: EdgeInsets.all(20),
//                   itemCount: listKeys.length,
//                   itemBuilder: (context, index) {
//                     var currentList = listBox.get(listKeys[index]);

//                     return InkWell(
//                         onTap: () {
//                           // selectedIndex = index;
//                           Navigator.push(context,
//                               MaterialPageRoute(builder: (context) {
//                             return ListAddingScreen(
//                                 isRepeat: currentList['isRepeat'] ?? false,
//                                 taskname: currentList['taskName'],
//                                 dueDate: currentList['dueDate'],
//                                 time: currentList['time'],
//                                 dropValue: currentList['dropValue'],
//                                 isEdit: true,
//                                 dropTime: currentList['dropTime'],
//                                 isCompleted: currentList["isCompleted"],
//                                 itemIndex: index);
//                           }));
//                           listKeys = listBox.keys.toList();
//                           setState(() {});
//                         },
//                         child: ListRowCard(
//                           taskName: currentList['taskName'],
//                           duedate: currentList['dueDate'],
//                           time: currentList['time'],
//                           dropValue: currentList['dropValue'],
//                           dropTime: currentList['dropTime'],
//                           isChecked: currentList["isCompleted"],
//                           isRepeat: currentList['isRepeat'] ?? false,
//                           // height: currentList["isCompleted"] ? 0 : 80,
//                           onChanged: (value) {
//                             listBox.put(listKeys[index], {
//                               'taskName': currentList['taskName'],
//                               'dueDate': currentList['dueDate'],
//                               'time': currentList['time'],
//                               'dropValue': currentList['dropValue'],
//                               'dropTime': currentList['dropTime'],
//                               'isRepeat': currentList['isRepeat'],
//                               'isCompleted':
//                                   value, // to update the state of checked box
//                             });
//                             listKeys = listBox.keys.toList();
//                             if (value == true) {
//                               Future.delayed(Duration(seconds: 2))
//                                   .then((value) {
//                                 listBox.delete(listKeys[index]);
//                                 listKeys = listBox.keys.toList();
//                                 setState(() {});
//                               });
//                             }

//                             setState(() {});
//                           },
//                         ));
//                     //   ],
//                     // );
//                   }),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hive/hive.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app/utils/app_sessions.dart';
import 'package:todo_app/utils/constants/color_constants.dart';
import 'package:todo_app/utils/constants/image_constants.dart';

import 'package:todo_app/view/dummydb.dart';
import 'package:todo_app/view/finished_list/finished_list.dart';
import 'package:todo_app/view/home_screen/widgets/appbar_dropdown_rowcard.dart';
import 'package:todo_app/view/home_screen/widgets/list_row_card.dart';
import 'package:todo_app/view/list_adding_screen/list_adding_screen.dart';
import 'package:todo_app/view/login_screen/login_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? dropValueH;
  var listBox = Hive.box(AppSessions.ListBox);
  var finishedBox = Hive.box(AppSessions.FinishedBox);

  List listKeys = [];
  List filteredListKeys = []; // New list for filtered keys
  
  @override
  void initState() {
    super.initState();
    listKeys = listBox.keys.toList();
    filteredListKeys = listKeys; // Initially, show all keys
  }

  void filterList() {
    if (dropValueH == null || dropValueH == Dummydb.app_dropdownData[0]) {
      filteredListKeys = listKeys.where((key) {
        var currentList = listBox.get(key);
        return currentList['isCompleted'] == false;
      }).toList();
    } else if (dropValueH == "Finished") {
      filteredListKeys = listKeys.where((key) {
        var currentList = listBox.get(key);
        return currentList['isCompleted'] == true;
      }).toList();
    } else {
      filteredListKeys = listKeys.where((key) {
        var currentList = listBox.get(key);
        return currentList['dropValue'] == dropValueH &&
            currentList['isCompleted'] == false;
      }).toList();
    }
    setState(() {});
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
                  builder: (context) => ListAddingScreen(),
                ));
            listKeys = listBox.keys.toList();
            filterList();
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
                    value: dropValueH ?? Dummydb.app_dropdownData[0],
                    dropdownColor: ColorConstants.violetlight,
                    items: List.generate(
                      Dummydb.app_dropdownData.length,
                      (index) => DropdownMenuItem(
                          value: Dummydb.app_dropdownData[index],
                          child: AppbarDropdownRowcard(
                            name: Dummydb.app_dropdownData[index],
                          )),
                    ),
                    onChanged: (value) {
                      setState(() {
                        dropValueH = value as String?;

                        filterList();
                        // if (dropValueH == Dummydb.app_dropdownData[6]) {
                        //   Navigator.push(
                        //       context,
                        //       MaterialPageRoute(
                        //         builder: (context) => FinishedList(),
                        //       ));
                        // } // Filter the list when dropdown changes
                      });
                    },
                  ),
                  Spacer(),
                  CircleAvatar(
                    radius: 20,
                    backgroundImage: AssetImage(ImageConstants.dp1),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  PopupMenuButton(
                    shadowColor: ColorConstants.violetlight,
                    iconColor: ColorConstants.whiteMain,
                    iconSize: 30,
                    color: ColorConstants.whiteMain,
                    itemBuilder: (context) => [
                      PopupMenuItem(
                          onTap: () async {
                            await listBox.clear();
                            listKeys = listBox.keys.toList();
                            filterList();
                          },
                          child: Text('Clear')),
                      PopupMenuItem(child: Text('Settings')),
                      PopupMenuItem(child: Text('Print')),
                      PopupMenuItem(
                          onTap: () async {
                            final SharedPreferences prefs =
                                await SharedPreferences.getInstance();
                            await prefs.clear();
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => LoginScreen(),
                                ));
                            setState(() {});
                          },
                          child: Text('Logout'))
                    ],
                  )
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                  padding: EdgeInsets.all(20),
                  itemCount: filteredListKeys.length, // Use the filtered list
                  itemBuilder: (context, index) {
                    var currentList = listBox.get(filteredListKeys[index]);
                    var finishedList = finishedBox.get(filteredListKeys[index]);

                    return InkWell(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return ListAddingScreen(
                                isRepeat: currentList['isRepeat'] ?? false,
                                taskname: currentList['taskName'],
                                dueDate: currentList['dueDate'],
                                time: currentList['time'],
                                dropValue: currentList['dropValue'],
                                isEdit: true,
                                dropTime: currentList['dropTime'],
                                isCompleted: currentList["isCompleted"],
                                itemIndex: index);
                          }));
                          listKeys = listBox.keys.toList();
                          filterList();
                        },
                        child: ListRowCard(
                          taskName: currentList['taskName'],
                          duedate: currentList['dueDate'],
                          time: currentList['time'],
                          dropValue: currentList['dropValue'],
                          dropTime: currentList['dropTime'],
                          isChecked: currentList["isCompleted"],
                          isRepeat: currentList['isRepeat'] ?? false,
                          onChanged: (value) {
                            listBox.put(filteredListKeys[index], {
                              'taskName': currentList['taskName'],
                              'dueDate': currentList['dueDate'],
                              'time': currentList['time'],
                              'dropValue': currentList['dropValue'],
                              'dropTime': currentList['dropTime'],
                              'isRepeat': currentList['isRepeat'],
                              'isCompleted': value,
                            });
                            listKeys = listBox.keys.toList();
                            // // move task to finished box
                            // finishedBox.put(finishedListKeys[index], {
                            //   'taskName': currentList['taskName'],
                            //   'dueDate': currentList['dueDate'],
                            //   'time': currentList['time'],
                            //   'dropValue': currentList['dropValue'],
                            //   'dropTime': currentList['dropTime'],
                            //   'isRepeat': currentList['isRepeat'],
                            //   'isCompleted': value,
                            // });
                            // finishedListKeys = finishedBox.keys.toList();
                            // if (value == true) {
                            Future.delayed(Duration(seconds: 2)).then((value) {
                              // listBox.delete(filteredListKeys[index]);
                              listKeys = listBox.keys.toList();
                              filterList();
                            });
                            // }
                            setState(() {});
                          },
                        ));
                  }),
            )
          ],
        ),
      ),
    );
  }
}
