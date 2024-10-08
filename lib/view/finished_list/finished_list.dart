import 'package:flutter/material.dart';
import 'package:todo_app/utils/constants/color_constants.dart';

class FinishedList extends StatelessWidget {
  const FinishedList({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
                    width: 20,
                  ),
                  InkWell(
                    onTap: () => Navigator.pop(context),
                    child: Icon(Icons.arrow_back_ios,
                        color: ColorConstants.whiteMain, size: 25),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Icon(
                    Icons.check_circle,
                    color: ColorConstants.whiteMain,
                    size: 30,
                  ),
                  SizedBox(
                    width: 20,
                  ),

                  Text(
                    'Finished',
                    style: TextStyle(
                        color: ColorConstants.whiteMain,
                        fontSize: 23,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 30,
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
