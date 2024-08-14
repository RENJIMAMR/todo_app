import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:share_plus/share_plus.dart';
import 'package:todo_app/utils/app_sessions.dart';
import 'package:todo_app/utils/constants/color_constants.dart';

class ListRowCard extends StatelessWidget {
  const ListRowCard(
      {super.key,
      required this.taskName,
      this.duedate,
      this.onChanged,
      this.isChecked = false,
      this.time});
  final String taskName;

  final String? duedate, time;

  final void Function(bool?)? onChanged;
  final bool isChecked;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          // duration: Duration(seconds: 2),
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
                        fillColor: WidgetStatePropertyAll(isChecked
                            ? ColorConstants.violetlight.withOpacity(.9)
                            : ColorConstants.whiteMain),
                        value: isChecked,
                        onChanged: onChanged),
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          taskName,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: ColorConstants.violetApp,
                              fontWeight: FontWeight.bold,
                              fontSize: 23),
                        ),
                        SizedBox(
                          width: 180,
                        ),
                        InkWell(
                            onTap: () {
                              Share.share('$taskName/n$duedate/n$time');
                            },
                            child: Icon(Icons.share))
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          duedate!,
                          style: TextStyle(
                              color: ColorConstants.violetlight,
                              fontWeight: FontWeight.bold,
                              fontSize: 17),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          time ?? '',
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
