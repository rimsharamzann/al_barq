import 'package:flutter/material.dart';

class PowerFilter extends StatefulWidget {
  const PowerFilter({super.key});

  @override
  State<PowerFilter> createState() => _PowerFilterState();
}

class _PowerFilterState extends State<PowerFilter> {
  final List<String> powerRanges = [
    "0-500W",
    "500W-1kW",
    "1kW-3kW",
    "3kW-5kW",
    "5kW+",
  ];

  final Set<String> selectedRanges = {};

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: const Text(
            "Power Range",
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 11),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: powerRanges.map((range) {
              final isSelected = selectedRanges.contains(range);
              return Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Transform.scale(
                    scale: 0.7,
                    child: Checkbox(
                      value: isSelected,
                      onChanged: (val) {
                        setState(() {
                          if (val == true) {
                            selectedRanges.add(range);
                          } else {
                            selectedRanges.remove(range);
                          }
                        });
                        debugPrint("Selected Power Ranges: $selectedRanges");
                      },
                      side: BorderSide(color: Colors.grey.shade500, width: 1.2),
                      checkColor: Colors.white,
                      activeColor: Colors.deepOrange,
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      visualDensity: const VisualDensity(
                        horizontal: -4,
                        vertical: -4,
                      ),
                    ),
                  ),
                  Text(
                    range,
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.grey.shade800.withValues ( alpha:  0.7),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
