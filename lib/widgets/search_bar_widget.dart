
import 'package:flutter/material.dart';
import 'package:store/core/helpers/app_field.dart';
import 'package:store/widgets/filter.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({
    super.key,
    required this.controller,
  });

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: AppField(
            controller: controller,
            hint: "Search for clothes...",
            isSearch: true,
          ),
        ),
        Filter(),
      ],
    );
  }
}
