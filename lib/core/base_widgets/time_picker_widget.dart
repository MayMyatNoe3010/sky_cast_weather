import 'package:flutter/material.dart';

class TimePickerWidget extends StatefulWidget {
  String label;
  Function callback;
  TimePickerWidget({super.key, required this.label, required this.callback});

  @override
  State<TimePickerWidget> createState() => _TimePickerWidgetState();
}

class _TimePickerWidgetState extends State<TimePickerWidget> {
  TimeOfDay selectedTime = TimeOfDay.now();
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.label),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('${selectedTime.hour}:${selectedTime.minute}'),
            IconButton(
              onPressed: () {
                selectTimeFromTimePicker(context);
              },
              icon: const Icon(Icons.expand_more_outlined),
              iconSize: 30,
            ),
          ],
        ),
        Divider()
      ],
    );
  }

  void selectTimeFromTimePicker(BuildContext context) async {
    final TimeOfDay? timeOfDay =
    await showTimePicker(context: context, initialTime: selectedTime);
    if (timeOfDay != null && timeOfDay != selectedTime) {
      DateTime now = DateTime.now();

      DateTime dateTime = DateTime(
        now.year,
        now.month,
        now.day,
        timeOfDay.hour,
        timeOfDay.minute,
      );

      setState(() {
        selectedTime = timeOfDay;

      });
      widget.callback.call(dateTime);
    }
  }
}
