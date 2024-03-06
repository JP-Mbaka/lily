import 'package:flutter/material.dart';
import 'package:lily/constants/imgRefs.dart';
import 'package:lily/constants/variables.dart';

class PopDialogs extends StatefulWidget {
  PopDialogs({
    super.key,
    required this.title,
    required this.message,
    required this.onPressYes,
  });
  final String title;
  final String message;
  final void Function() onPressYes;

  @override
  State<PopDialogs> createState() => _PopDialogsState();

  static alertMessage({required context, icon, message, goback = false}) {
    showDialog(
        context: context,
        builder: (context) => _alertMessage(
              context: context,
              icon: icon,
              message: message,
              goback: goback,
            ));
  }

  static Widget _alertMessage({context, icon, message, goback}) {
    return AlertDialog(
      elevation: 2.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      title: (icon != null)
          ? Image.asset(failedTIcon) // SvgPicture.asset(icon)
          : CircleAvatar(
              radius: height(context) * 0.06,
              backgroundColor: Colors.greenAccent, //GREEN.withOpacity(0.2),
              child: Image.asset(successTIcon)
              // SvgPicture.asset(
              //   successIcon,
              //   height: height(context) * 0.08,
              // ),
              ),
      content: Text(
        message,
        textAlign: TextAlign.center,
        // style: mediumBodyStyle(),
      ),
      actionsAlignment: MainAxisAlignment.spaceEvenly,
      actions: [
        ElevatedButton(
          onPressed: () {},
          child: const Text("Close"),
        ),
        // primaryButton(
        //   text: 'Close',
        //   hPadding: width(context) * 0.15,
        //   onClick: () {
        //     Get.back();
        //     Get.back();
        //     if (goback) {
        //       Get.back();
        //     }
        //   },
        // ),
        SizedBox(height: height(context) * 0.05),
      ],
    );
  }

  static popDialogs({
    required context,
    title,
    message,
    onPressYes,
  }) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => PopDialogs(
        title: title,
        message: message,
        onPressYes: onPressYes,
      ),
    );
  }
}

class _PopDialogsState extends State<PopDialogs> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      elevation: 2.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      title: Text(
        widget.title,
        textAlign: TextAlign.center,
        // style: mediumBodyStyle(
        //   weight: FontWeight.bold,
        //   fontSize: 16.0,
        // ),
      ),
      content: Text(
        widget.message,
        textAlign: TextAlign.center,
        // style: mediumBodyStyle(color: GREY2.withOpacity(0.6)),
      ),
      actionsAlignment: MainAxisAlignment.spaceEvenly,
      actions: [
        TextButton(
            onPressed: widget.onPressYes,
            child: Text(
              'Delete',
              // style: mediumBodyStyle(
              //   color: RED1,
              //   weight: FontWeight.w500,
              // ),
            )),
        TextButton(
            onPressed: () {
              // Get.back();
            },
            child: Text(
              'Cancel',
              // style: mediumBodyStyle(weight: FontWeight.w500),
            )),
        SizedBox(height: height(context) * 0.05),
      ],
    );
  }
}
