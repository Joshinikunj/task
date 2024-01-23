import 'package:flutter/material.dart';

Size displaySize(BuildContext context) {
  return MediaQuery.of(context).size;
}

double displayHeight(BuildContext context) {
  return displaySize(context).height;
}

double displayWidth(BuildContext context) {
  return displaySize(context).width;
}

//Rich Text Style

customText({required String title, required String desc}) {
  return RichText(
    text: TextSpan(
      text: title,
      style: const TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w600,
      ),
      children: <TextSpan>[
        TextSpan(
          // text: desc.length <= 25 ? desc : '${desc.substring(0, 25)}...',
          text: desc,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.normal,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    ),
  );
}
