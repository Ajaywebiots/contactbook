import 'package:contactbook/extensions/widget_extension.dart';
import 'package:flutter/material.dart';

class FilterBottomSheet extends StatefulWidget {
  const FilterBottomSheet({super.key});

  @override
  State<FilterBottomSheet> createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<FilterBottomSheet> {
  double start = 0;
  double end = 50;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 500,
        child: Column(children: [
          Row(children: [
            const Text("Price -"),
            Expanded(
                child: RangeSlider(
                    values: RangeValues(start, end),
                    labels: RangeLabels(start.toString(), end.toString()),
                    onChanged: (value) {
                      setState(() {
                        start = value.start;
                        end = value.end;
                      });
                    },
                    min: 0,
                    max: 80))
          ]),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text("Start: \n ${start.toStringAsFixed(2)}").padding(left: 50),
            Text("End: \n ${end.toStringAsFixed(2)}", textAlign: TextAlign.end)
                .padding(right: 10)]),
          const SizedBox(height: 40),
          const Row(children: [Text("Size")])
        ]));
  }
}
