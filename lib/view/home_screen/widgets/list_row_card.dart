import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:todo_app/utils/constants/color_constants.dart';

class ListRowCard extends StatelessWidget {
  const ListRowCard(
      {super.key,
      required this.taskName,
      this.duedate,
      this.onChanged,
      this.isChecked = false,
      this.time,
      this.dropValue,
      this.isRepeat = false,
      this.dropTime});
  final String taskName;

  final String? duedate, time, dropValue, dropTime;

  final void Function(bool?)? onChanged;
  final bool isChecked, isRepeat;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
         
          decoration: BoxDecoration(
              color: ColorConstants.blueGrey.withOpacity(.5),
              borderRadius: BorderRadius.circular(20)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 7,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Checkbox(
                        fillColor: WidgetStatePropertyAll(isChecked
                            ? ColorConstants.violetlight.withOpacity(.9)
                            : ColorConstants.whiteMain),
                        value: isChecked,
                        onChanged: onChanged),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      taskName,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: ColorConstants.violetApp,
                          fontWeight: FontWeight.bold,
                          fontSize: 23),
                    ),
                    Spacer(),
                    InkWell(
                        onTap: () {
                          Share.share('$taskName/n$duedate/n$time');
                        },
                        child: Icon(Icons.share)),
                    SizedBox(
                      width: 10,
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Row(
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
                    isRepeat
                        ? Icon(
                            Icons.repeat,
                            color: ColorConstants.whiteMain,
                          )
                        : SizedBox(
                            width: 10,
                          ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: Text(
                  dropValue ?? '',
                  style: TextStyle(
                      color: ColorConstants.blueGrey,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              ),
              SizedBox(
                height: 20,
              )
            ],
          ),
        ),
        SizedBox(
          height: 15,
        )
      ],
    );
  }
}
