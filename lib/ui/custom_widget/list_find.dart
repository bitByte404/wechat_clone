import 'package:flutter/material.dart';
import 'package:wechat_clone/gen/assets.gen.dart';

import '../../value/colors.dart';
import '../../value/sizes.dart';

class FindList extends StatelessWidget {
  const FindList({super.key,  required this.items});

  final List<FindItem> items;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: List.generate(items.length, (index) {
              return Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    color: Colors.white,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(5),
                              child: Image.asset(
                                items[index].iconPath,
                                height: AppSizes.findIconSize,
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
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(Assets.images.iconArrow.path, width: 8,),
                        )
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
      ),
    );
  }
}

class FindItem {
  final String name;
  final String iconPath;

  FindItem(this.name, this.iconPath);
}