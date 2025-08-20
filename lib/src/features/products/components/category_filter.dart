import 'package:flutter/material.dart';

class CategoryFilter extends StatefulWidget {
  const CategoryFilter({super.key});

  @override
  State<CategoryFilter> createState() => _CategoryFilterState();
}

class _CategoryFilterState extends State<CategoryFilter> {
  final List<String> categories = [
    "All Products",
    "Solar Panels",
    "Inverters",
    "Batteries",
    "Accessories",
    "Complete Packages",
  ];

  String selectedCategory = "";

  @override
  void initState() {
    super.initState();
    selectedCategory = categories.first; // By default, first one selected
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 10, 15, 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Categories",
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Column(
            children:
                categories.map((cat) {
                  final isSelected = cat == selectedCategory;
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedCategory = cat;
                      });
                      debugPrint("Selected: $cat");
                    },
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                        vertical: 8,
                        horizontal: 16,
                      ),
                      decoration: BoxDecoration(
                        color:
                            isSelected ? Colors.deepOrange : Colors.transparent,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Text(
                        cat,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color:
                              isSelected
                                  ? Colors.white
                                  : Colors.grey.shade800.withValues( alpha:  0.8),
                          fontWeight:
                              isSelected ? FontWeight.w500 : FontWeight.bold,
                          fontSize: 13,
                        ),
                      ),
                    ),
                  );
                }).toList(),
          ),
        ],
      ),
    );
  }
}
