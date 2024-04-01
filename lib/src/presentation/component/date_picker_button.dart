import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:meeting_voting/src/presentation/component/button.dart';

class DatePickerButton extends StatefulWidget {
  const DatePickerButton({
    super.key,
    required this.dateTime,
    required this.onChanged,
  });

  final DateTime dateTime;
  final void Function(DateTime) onChanged;

  @override
  State<DatePickerButton> createState() => _DatePickerButtonState();
}

class _DatePickerButtonState extends State<DatePickerButton> {
  @override
  Widget build(BuildContext context) {
    return Button(
      onTap: () async {
        final dateTime = await showDatePicker(
          context: context,
          firstDate: DateTime(2022),
          lastDate: DateTime.now(),
          currentDate: widget.dateTime,
          initialEntryMode: DatePickerEntryMode.calendarOnly,
        );

        if (dateTime != null) {
          widget.onChanged(dateTime);
        }
      },
      child: Text(DateFormat('MMM dd, yyyy').format(widget.dateTime)),
    );
  }
}
