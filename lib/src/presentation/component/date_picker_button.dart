import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:meeting_voting/src/presentation/component/button/button.dart';
import 'package:widget_tooltip/widget_tooltip.dart';

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
  final TooltipController _tooltipController = TooltipController();

  @override
  Widget build(BuildContext context) {
    return WidgetTooltip(
      controller: _tooltipController,
      triggerMode: WidgetTooltipTriggerMode.tap,
      dismissMode: WidgetTooltipDismissMode.tapOutside,
      triangleColor: Colors.transparent,
      messagePadding: EdgeInsets.zero,
      messageDecoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      message: SizedBox(
        width: 320,
        height: 240,
        child: CalendarDatePicker(
          initialDate: widget.dateTime,
          firstDate: DateTime(2022),
          lastDate: DateTime.now(),
          currentDate: widget.dateTime,
          onDateChanged: widget.onChanged,
        ),
      ),
      child: Button.primary(
        onTap: _tooltipController.toggle,
        child: Text(
          DateFormat('MMM dd, yyyy').format(widget.dateTime),
        ),
      ),
    );
  }
}
