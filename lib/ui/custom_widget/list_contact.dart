import 'package:flutter/material.dart';

import '../../value/colors.dart';
import '../../value/sizes.dart';

class ContactList extends StatelessWidget {
  const ContactList({super.key, this.groupName, required this.items});

  final String? groupName;
  final List<ContactItem> items;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (groupName != null)
          Padding(
            padding: const EdgeInsets.only(top: 6, bottom: 6, left: 6),
            child: Text(
              groupName!,
              style: const TextStyle(fontSize: 13, color: Colors.grey),
            ),
          ),
        Column(
          children: List.generate(items.length, (index) {
            return Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  color: Colors.white,
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: Image.asset(
                          items[index].iconPath,
                          height: AppSizes.contactIconSize,
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Text(
                        items[index].name,
                        style: const TextStyle(
                          fontSize: AppSizes.contatactItemTextSize,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
                if (index < items.length - 1)
                  Container(
                    padding: const EdgeInsets.only(left: 60),
                    color: Colors.white,
                    child: Divider(
                      color: AppColors.chatListItemDividerBackground,
                      thickness: 1,
                    ),
                  ),
              ],
            );
          }),
        ),
      ],
    );
  }
}

class ContactItem {
  final String name;
  final String iconPath;

  ContactItem(this.name, this.iconPath);
}