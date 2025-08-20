import 'package:flutter/material.dart';
import 'package:flutter_xlider/flutter_xlider.dart';
import 'package:intl/intl.dart'; 

class PriceRangeSlider extends StatefulWidget {
  const PriceRangeSlider({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _PriceRangeSliderState createState() => _PriceRangeSliderState();
}

class _PriceRangeSliderState extends State<PriceRangeSlider> {
  double _lowerValue = 0;
  double _upperValue = 250000;

  String _formatNumber(double value) {
    final formatter = NumberFormat("#,###");
    return formatter.format(value.toInt());
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 15),
          child: Text(
            "Price Range",
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(height: 4),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 13),
          child: SizedBox(
            height: 30,
            child: FlutterSlider(
              values: [_lowerValue, _upperValue],
              rangeSlider: true,
              min: 0,
              max: 300000,
              handlerHeight: 20,
              handlerWidth: 20,
              tooltip: FlutterSliderTooltip(disabled: true),
              trackBar: FlutterSliderTrackBar(
                activeTrackBar: BoxDecoration(color: Colors.deepOrange),
                inactiveTrackBar: BoxDecoration(
                  color: Colors.grey.withValues( alpha:  0.5),
                ),
                activeTrackBarHeight: 5.5,
                inactiveTrackBarHeight: 5,
              ),
              handler: FlutterSliderHandler(
                decoration: const BoxDecoration(),
                child: Container(
                  width: 18,
                  height: 18,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    border: Border.all(color: Colors.deepOrange, width: 1.5),
                  ),
                ),
              ),
              rightHandler: FlutterSliderHandler(
                decoration: const BoxDecoration(),
                child: Container(
                  width: 18,
                  height: 18,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    border: Border.all(color: Colors.deepOrange, width: 1.5),
                  ),
                ),
              ),
              onDragging: (handlerIndex, lowerValue, upperValue) {
                setState(() {
                  _lowerValue = lowerValue;
                  _upperValue = upperValue;
                });
              },
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 14, right: 22, bottom: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Rs. ${_formatNumber(_lowerValue)}",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey.shade800.withValues( alpha:  0.7),
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Rs. ${_formatNumber(_upperValue)}",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey.shade800.withValues( alpha:  0.7),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
