import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DatePickerButton extends StatefulWidget {
  const DatePickerButton({super.key});

  @override
  State<DatePickerButton> createState() => _DatePickerButtonState();
}

class _DatePickerButtonState extends State<DatePickerButton> {
  late DateTime _dateTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: GestureDetector(
        onTap: () async {
          final dateTime = await showDatePicker(
            context: context,
            firstDate: DateTime(2022),
            lastDate: DateTime.now(),
            currentDate: DateTime.now(),
          );

          if (dateTime != null) {
            setState(() {
              _dateTime = dateTime;
            });
          }
        },
        child: Container(
          width: 200,
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            border: Border.all(),
            borderRadius: BorderRadius.circular(4),
          ),
          child: Text(DateFormat('MMM dd, yyyy').format(_dateTime)),
        ),
      ),
    );
  }
}
