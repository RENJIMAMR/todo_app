import 'package:flutter/material.dart';
import 'package:todo_app/utils/constants/color_constants.dart';

class DropdownRowcard extends StatelessWidget {
  const DropdownRowcard({super.key, required this.name});
  final String name;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Icon(
          Icons.list,
          color: ColorConstants.greyMain,
        ),
        SizedBox(
          width: 20,
        ),
        Text(
          name,
          style: TextStyle(
              color: ColorConstants.greyMain,
              fontSize: 17,
              fontWeight: FontWeight.w500),
        ),
        SizedBox(
          width: 50,
        ),
      ],
    );
  }
}
