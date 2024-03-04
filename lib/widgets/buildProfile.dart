import 'package:flutter/material.dart';

Widget buildProfileMenu(context,
    {iconColor, icon, iconBorderColor, iconContainerColor, title, onClick}) {
  return Container(
    decoration: BoxDecoration(
      color: Theme.of(context).colorScheme.onPrimary,
      border: Border.all(color: Theme.of(context).primaryColor),
      borderRadius: const BorderRadius.all(Radius.circular(15)),
    ),
    margin: const EdgeInsets.symmetric(horizontal: 10),
    padding: const EdgeInsets.all(10.0),
    child: InkWell(
      onTap: onClick,
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
                color: iconContainerColor ??
                    const Color.fromARGB(169, 141, 36, 170),
                shape: BoxShape.circle,
                border: Border.all(color: iconBorderColor ?? Colors.purple)),
            padding: const EdgeInsets.all(8.0),
            child: icon ?? const Icon(Icons.airplane_ticket),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Text(
              title ?? '',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: Theme.of(context).colorScheme.primary,
                  ),
            ),
          ),
          const Icon(
            Icons.arrow_forward_ios,
            color: Colors.grey,
          )
        ],
      ),
    ),
  );
}
