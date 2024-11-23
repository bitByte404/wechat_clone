import 'package:flutter/material.dart';

import '../../value/colors.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key, required this.label, required this.hint, this.controller, this.keyboardType});
  final String label;
  final String hint;
  final TextEditingController? controller;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(
                  width: 100,
                  child: Text(
                    label,
                    style: const TextStyle(fontSize: 20),
                  )),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                child: TextField(
                  controller: controller,
                  keyboardType: keyboardType,
                  cursorColor: AppColors.primaryColor,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: hint,
                      hintStyle: const TextStyle(
                          color: AppColors.chatListItemMessageTextColor,
                          fontSize: 16)),
                ),
              )
            ],
          ),
          const Divider(
            color: AppColors.dividerColor,
          )
        ],
      ),
    );
  }
}
