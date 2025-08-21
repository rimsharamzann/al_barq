
import 'package:al_barq/src/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/assets_strings.dart';

class DiscoverProductsSection extends StatelessWidget {
  const DiscoverProductsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.height / 1.4,
      color: Colors.white,
      width: context.width,
      child: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFFFF5722), Color(0xFFFF6D00)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            padding: const EdgeInsets.all(30),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Left Text + Search
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Discover Our Solar Products",
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        "Find the perfect solar solution for your home or business",
                        style: TextStyle(fontSize: 20, color: Colors.white70),
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        width: context.width / 3,
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: "Search products...",
                            hintStyle: const TextStyle(color: Colors.black45),
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 10,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6),
                              borderSide: BorderSide.none,
                            ),
                            suffix: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.black,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 14,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6),
                                ),
                              ),
                              onPressed: () {},
                              child: const Text(
                                "Search",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(width: 20),

                // Right Images
                Expanded(
                  flex: 2,
                  child: Column(
                    spacing: 10,
                    children: [
                      Row(
                        children: [
                          _tiltedImage(AssetString.authBg, 6),
                          SizedBox(width: 30),
                          _tiltedImage(AssetString.solarPanel, 6),
                        ],
                      ),
                      Row(
                        children: [
                          _tiltedImage(AssetString.bgImage, 6),
                          SizedBox(width: 30),

                          _tiltedImage(AssetString.solarPanel, 6),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          Container(
            clipBehavior: Clip.none,
            width: context.width,
            color: Colors.black,
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 10),
            child: Stack(
              children: [
                SizedBox(),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      BoxWidget(
                        icon: Icons.wb_sunny,
                        label: "All Products",
                        selected: true,
                        mainColor: Colors.deepOrange,
                      ),
                      BoxWidget(
                        icon: Icons.solar_power,
                        label: "Solar Panels",
                        selected: false,
                        mainColor: Colors.deepOrange,
                      ),
                      BoxWidget(
                        icon: Icons.flash_on,
                        label: "Inverters",
                        selected: false,
                        mainColor: Colors.deepOrange,
                      ),
                      BoxWidget(
                        icon: Icons.battery_charging_full,
                        label: "Batteries",
                        selected: false,
                        mainColor: Colors.deepOrange,
                      ),
                      BoxWidget(
                        icon: Icons.build,
                        label: "Accessories",
                        selected: false,
                        mainColor: Colors.deepOrange,
                      ),
                      BoxWidget(
                        icon: Icons.all_inbox,
                        label: "Packages",
                        selected: false,
                        mainColor: Colors.deepOrange,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _tiltedImage(String url, double angle) {
    return Transform.rotate(
      angle: angle * 3.1416 / 180,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(14),
        child: Image.asset(url, height: 120, width: 300, fit: BoxFit.cover),
      ),
    );
  }
}

class BoxWidget extends StatefulWidget {
  final IconData icon;
  final String label;
  final bool selected;
  final Color mainColor;

  const BoxWidget({
    super.key,
    required this.icon,
    required this.label,
    required this.selected,
    required this.mainColor,
  });

  @override
  State<BoxWidget> createState() => _BoxWidgetState();
}

class _BoxWidgetState extends State<BoxWidget> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: Container(
        width: 120,
        height: 150,
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
        decoration: BoxDecoration(
          color: widget.selected
              ? Colors.deepOrange
              : _isHovered
              ? widget.mainColor
              : Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: widget.selected
              ? []
              : [const BoxShadow(color: Colors.black12, blurRadius: 5)],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              widget.icon,
              size: 20,
              color: widget.selected || _isHovered
                  ? Colors.white
                  : Colors.black54,
            ),
            const SizedBox(height: 6),
            Text(
              widget.label,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: widget.selected || _isHovered
                    ? Colors.white
                    : Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
