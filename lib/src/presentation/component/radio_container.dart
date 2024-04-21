import 'package:flutter/material.dart';
import 'package:meeting_voting/src/presentation/component/button/button.dart';

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

class RadioContainer<T> extends StatefulWidget {
  const RadioContainer({
    super.key,
    required this.children,
    this.wrap = false,
    this.multiple = false,
    required this.onChanged,
  });

  final List<CustomRadio<T>> children;
  final bool wrap;
  final bool multiple;
  final void Function(List<dynamic>) onChanged;

  @override
  State<RadioContainer> createState() => _RadioContainerState<T>();
}

class _RadioContainerState<T> extends State<RadioContainer> {
  final _selectedList = <T>[];

  @override
  Widget build(BuildContext context) => switch (widget.wrap) {
        true => Wrap(
            spacing: 6,
            runSpacing: 6,
            children: widget.children.map((e) {
              return Button.primary(
                onTap: () {
                  setState(() {
                    if (widget.multiple) {
                      if (_selectedList.contains(e.value)) {
                        _selectedList.remove(e.value);
                      } else {
                        _selectedList.add(e.value);
                      }
                    } else {
                      if (_selectedList.contains(e.value)) {
                        _selectedList.clear();
                      } else {
                        _selectedList.clear();
                        _selectedList.add(e.value);
                      }
                    }
                  });

                  widget.onChanged.call(_selectedList);
                },
                // pressed: _selectedList.contains(e.value),
                child: Text(e.label),
              );
            }).toList(),
          ),
        false => ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: widget.children.length,
            itemBuilder: (context, index) {
              final e = widget.children[index];
              return Align(
                alignment: Alignment.centerLeft,
                child: Button.primary(
                  onTap: () {
                    setState(() {
                      if (widget.multiple) {
                        if (_selectedList.contains(e.value)) {
                          _selectedList.remove(e.value);
                        } else {
                          _selectedList.add(e.value);
                        }
                      } else {
                        if (_selectedList.contains(e.value)) {
                          _selectedList.clear();
                        } else {
                          _selectedList.clear();
                          _selectedList.add(e.value);
                        }
                      }
                    });

                    widget.onChanged.call(_selectedList);
                  },
                  // pressed: _selectedList.contains(e.value),
                  child: Text(e.label),
                ),
              );
            },
            separatorBuilder: (context, index) => const SizedBox(height: 6),
          )
      };
}
