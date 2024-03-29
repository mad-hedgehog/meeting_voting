import 'package:flutter/material.dart';
import 'package:meeting_voting/src/presentation/component/button.dart';

class CustomRadio<T> {
  CustomRadio({
    required this.label,
    required this.value,
  });

  final String label;
  final T value;

  @override
  String toString() => '$label, $value';
}

class RadioContainer extends StatefulWidget {
  const RadioContainer({
    super.key,
    required this.children,
    this.multiple = false,
    required this.onChanged,
  });

  final List<CustomRadio> children;
  final bool multiple;
  final Function(List<dynamic> selected) onChanged;

  @override
  State<RadioContainer> createState() => _RadioContainerState();
}

class _RadioContainerState extends State<RadioContainer> {
  final List<dynamic> _selectedList = [];

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: widget.children.length,
      itemBuilder: (context, index) {
        final e = widget.children[index];
        return Align(
          alignment: Alignment.centerLeft,
          child: Button(
            onPressed: () {
              setState(() {
                if (widget.multiple) {
                  if (_selectedList.contains(e)) {
                    _selectedList.remove(e);
                  } else {
                    _selectedList.add(e);
                  }
                } else {
                  _selectedList.clear();
                  _selectedList.add(e);
                }
              });

              widget.onChanged(_selectedList);
            },
            pressed: _selectedList.contains(e),
            child: Text(e.label),
          ),
        );
      },
      separatorBuilder: (context, index) => const SizedBox(height: 6),
    );
  }
}
