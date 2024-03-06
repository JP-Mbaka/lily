import 'package:flutter/material.dart';
import 'package:lily/constants/imgRefs.dart';
import 'package:lily/constants/variables.dart';

ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showCloseSnackBar(
    context,
    {isNO = false,
    String title = '',
    String msg = ''}) {
  ScaffoldMessenger.of(context).clearSnackBars();

  final snackBar = SnackBar(
      backgroundColor: isNO
          ? Theme.of(context).colorScheme.errorContainer
          : Theme.of(context).colorScheme.primary,
      behavior: SnackBarBehavior.floating,
      shape: BeveledRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
      padding: const EdgeInsets.all(0),
      content: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                color: isNO
                    ? Theme.of(context).colorScheme.error
                    : Theme.of(context).colorScheme.secondaryContainer,
                child: Image.asset(
                  isNO ? redSplashIcon : greenSplashIcon,
                  height: height(context) * 0.08,
                  width: width(context) * 0.2,
                  fit: BoxFit.fill,
                ),
              ),
              Positioned(
                left: width(context) * 0.03,
                top: height(context) * 0.005,
                child: IconButton(
                  onPressed: () {},
                  style: IconButton.styleFrom(
                      foregroundColor: isNO
                          ? Theme.of(context).colorScheme.errorContainer
                          : Theme.of(context).colorScheme.onPrimary),
                  icon: const Icon(
                    Icons.close,
                    size: 25,
                    weight: 15,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(width: width(context) * 0.02),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: isNO
                        ? Theme.of(context).colorScheme.error
                        : Theme.of(context).colorScheme.onSecondaryContainer),
              ),
              Text(
                msg,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    // fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: isNO
                        ? Theme.of(context).colorScheme.onErrorContainer
                        : Theme.of(context).colorScheme.onPrimary),
              ),
            ],
          ),
        ],
      ));
  return ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
