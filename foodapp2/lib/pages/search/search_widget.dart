import 'package:flutter/material.dart';
import '/core/color_constant.dart';

class SearchWidget extends StatelessWidget {
  final TextEditingController searchController;
  final ValueChanged<String> onSearchChanged;

  const SearchWidget(
      {super.key,
      required this.searchController,
      required this.onSearchChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: primary,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: ashYellow, width: 2), // Border added here
      ),
      child: TextField(
        controller: searchController,
        decoration: const InputDecoration(
          hintText: 'Search Meal..',
          hintStyle: TextStyle(color: black),
          border: InputBorder.none,
          prefixIcon: Icon(Icons.search, color: black, size: 18),
        ),
        style: const TextStyle(color: black, fontSize: 18),
        onChanged: onSearchChanged,
      ),
    );
  }
}
