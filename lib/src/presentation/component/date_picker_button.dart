import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:meeting_voting/src/presentation/component/button.dart';

class DatePickerButton extends StatefulWidget {
  const DatePickerButton({super.key});

  @override
  State<DatePickerButton> createState() => _DatePickerButtonState();
}

class _DatePickerButtonState extends State<DatePickerButton> {
  late DateTime _dateTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Button(
      onPressed: () async {
        final dateTime = await showDatePicker(
          context: context,
          firstDate: DateTime(2022),
          lastDate: DateTime.now(),
          currentDate: _dateTime,
        );

        if (dateTime != null) {
          setState(() {
            _dateTime = dateTime;
          });
        }
      },
      child: Text(DateFormat('MMM dd, yyyy').format(_dateTime)),
    );
  }
}
