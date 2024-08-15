import 'package:flutter/material.dart';
import 'package:todo_app/utils/constants/color_constants.dart';

class AppbarDropdownRowcard extends StatelessWidget {
  const AppbarDropdownRowcard({super.key, required this.name});
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
          style: TextStyle(color: ColorConstants.greyMain),
        ),
        SizedBox(
          width: 50,
        ),
        // Spacer(),
        Text(
          '1',
          style: TextStyle(color: ColorConstants.greyMain),
        )
      ],
    );
  }
}
