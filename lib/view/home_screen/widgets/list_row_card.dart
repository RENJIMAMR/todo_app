import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todo_app/utils/app_sessions.dart';
import 'package:todo_app/utils/constants/color_constants.dart';

class ListRowCard extends StatefulWidget {
  const ListRowCard(
      {super.key,
      required this.taskName,
      this.duedate,
      this.onDelete,
      this.time});
  final String taskName;
  final String? duedate, time;
  final void Function()? onDelete;
  @override
  State<ListRowCard> createState() => _ListRowCardState();
}

class _ListRowCardState extends State<ListRowCard> {
  bool checkValue = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 80,
          decoration: BoxDecoration(
              color: ColorConstants.blueGrey.withOpacity(.5),
              borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Checkbox(
                      // checkColor: ColorConstants.violetlight,
                      fillColor: WidgetStatePropertyAll(checkValue
                          ? ColorConstants.violetlight.withOpacity(.9)
                          : ColorConstants.whiteMain),

                      value: checkValue,
                      onChanged: (value) {
                        setState(() {
                          checkValue = value!;
                        });
                        if (checkValue != null && widget.onDelete != null) {
                          widget.onDelete!();
                        }
                      },
                    ),
                    SizedBox(
                      height: 12,
                    )
                  ],
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.taskName,
                      style: TextStyle(
                          color: ColorConstants.violetApp,
                          fontWeight: FontWeight.bold,
                          fontSize: 23),
                    ),
                    Row(
                      children: [
                        Text(
                          widget.duedate!,
                          style: TextStyle(
                              color: ColorConstants.violetlight,
                              fontWeight: FontWeight.bold,
                              fontSize: 17),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          widget.time ?? '',
                          style: TextStyle(
                              color: ColorConstants.violetlight,
                              fontWeight: FontWeight.bold,
                              fontSize: 17),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(
                          Icons.repeat,
                          color: ColorConstants.whiteMain,
                        )
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        SizedBox(
          height: 15,
        )
      ],
    );
  }
}
