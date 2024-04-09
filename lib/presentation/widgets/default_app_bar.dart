// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';

class DefaultAppBar extends StatelessWidget {
  const DefaultAppBar(
      {Key? key, this.back = true, required this.title, this.backGroundColor})
      : super(key: key);
  final bool back;
  final Color? backGroundColor;
  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      // centerTitle: true,
      backgroundColor: backGroundColor,
      leading: back == true
          ? IconButton(
              onPressed: () {
                Navigator.pop(context);
                // Get.back();
              },
              icon: const Icon(
                Icons.arrow_back,
                // color: Colors.black,
              ))
          : null,
      title: Text(
        title,
        textScaleFactor: 1.0,
        style: Theme.of(context)
            .textTheme
            .titleLarge
            ?.copyWith(fontWeight: FontWeight.w600,fontSize: 19),
      ),
      elevation: 0,
      // leadingWidth: back == false ? 140 : 56.0,
    );
  }
}
