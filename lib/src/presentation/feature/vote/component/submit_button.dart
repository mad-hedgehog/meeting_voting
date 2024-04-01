import 'package:flutter/material.dart';

class SubmitButton extends StatelessWidget {
  const SubmitButton({
    super.key,
    required this.onPressed,
  });

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        splashFactory: NoSplash.splashFactory,
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0))),
        backgroundColor: MaterialStateProperty.all<Color?>(Colors.white),
        overlayColor: MaterialStateProperty.all<Color?>(const Color(0xfffefefe)),
        shadowColor: MaterialStateProperty.all<Color?>(Colors.white),
        surfaceTintColor: MaterialStateProperty.all<Color?>(Colors.white),
        padding: MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.symmetric(horizontal: 8)),
      ),
      onPressed: onPressed,
      child: const Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Submit'),
          SizedBox(width: 8),
          Icon(
            Icons.arrow_forward_rounded,
            size: 14,
          ),
        ],
      ),
    );
  }
}
