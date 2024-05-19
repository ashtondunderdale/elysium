import 'package:barden_book_project/common/barden_close_icon.dart';
import 'package:barden_book_project/common/barden_dropdown.dart';
import 'package:flutter/material.dart';

import '../../../common/barden_button.dart';
import '../../../constants.dart';
import '../../../login/views/login.dart';

class InventoryTitleBar extends StatelessWidget {
  const InventoryTitleBar({super.key, required this.activeAction, required this.onReadingCategorySelected, required this.onReadingYearSelected, required this.onFiltersCleared});

  final String activeAction;
  final Function(String) onReadingCategorySelected;
  final Function(String) onReadingYearSelected;

  final VoidCallback onFiltersCleared;

  @override
  Widget build(BuildContext context) => Row(
    children: [
      SizedBox(
        width: MediaQuery.sizeOf(context).width - 240,
        child: Padding(
          padding: const EdgeInsets.only(left: 32, top: 16),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 32),
                child: Text(
                  activeAction,
                  style: primaryFont.copyWith(
                    color: const Color.fromARGB(255, 58, 58, 58),
                    fontSize: 32,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
              BardenDropdown(items: readingCategories, onItemSelected: (item) {
                onReadingCategorySelected(item);
              }), 
              BardenDropdown(items: readingYears, onItemSelected: (item) {
                onReadingYearSelected(item);
              }), 
              Tooltip(
                message: "Clear Filters",
                child: BardenIconButton(
                  icon: Icon(
                    Icons.clear,
                    color: bardenPurple,
                    size: 20,
                  ),
                  onPressed: () {
                    onFiltersCleared();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      BardenButton(
        width: 100,
        text: "LOGOUT", 
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const Login()));
        }, 
        isLoading: false
      )
    ],
  );
}
