import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lily/constants/imgRefs.dart';
import 'package:lily/constants/variables.dart';

class PopDialogs extends StatefulWidget {
  const PopDialogs({
    super.key,
    required this.title,
    required this.message,
    this.yes,
    this.no,
    required this.onPressYes,
  });
  final String title, message;
  final String? yes, no;
  final void Function() onPressYes;

  @override
  State<PopDialogs> createState() => _PopDialogsState();

  static alertMessage({required context, icon, message, goback}) {
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
      title: CircleAvatar(
        radius: height(context) * 0.06,
        backgroundColor: (icon != null)
            ? Theme.of(context).colorScheme.errorContainer
            : Theme.of(context).colorScheme.primaryContainer,
        child: (icon != null)
            ? SvgPicture.asset(
                icon,
                height: height(context) * 0.08,
              )
            : SvgPicture.asset(
                successIcon,
                height: height(context) * 0.08,
              ),
      ),
      content: Text(
        message,
        textAlign: TextAlign.center,
        style: Theme.of(context)
            .textTheme
            .bodyMedium!
            .copyWith(color: Theme.of(context).colorScheme.onTertiaryContainer),
      ),
      actionsAlignment: MainAxisAlignment.center,
      actions: [
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
            if (goback == 2) {
              Navigator.pop(context);
              Navigator.pop(context);
            }
            if (goback) {
              Navigator.pop(context);
            }
          },
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
    String? yes,
    String? no,
    onPressYes,
  }) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => PopDialogs(
        title: title,
        message: message,
        yes: yes,
        no: no,
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
        style: Theme.of(context).textTheme.titleLarge!.copyWith(
            color: Theme.of(context).colorScheme.primary,
            fontWeight: FontWeight.w500),
      ),
      content: Text(
        widget.message,
        textAlign: TextAlign.center,
        style: Theme.of(context)
            .textTheme
            .bodyMedium!
            .copyWith(color: Theme.of(context).colorScheme.onTertiaryContainer),
      ),
      actionsAlignment: MainAxisAlignment.spaceEvenly,
      actions: [
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              widget.no ?? 'Delete',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Theme.of(context).colorScheme.error,
                  ),
            )),
        TextButton(
            onPressed: widget.onPressYes,
            child: Text(
              widget.yes ?? 'Continue',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.w500),
            )),
        SizedBox(height: height(context) * 0.05),
      ],
    );
  }
}
