import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button({
    super.key,
    required this.icon,
    required this.ontap,
  });

  final IconData icon;
  final Function() ontap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.grey.shade300,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: ontap,
        child: SizedBox(
          height: 70,
          width: 100,
          child: Center(
            child: Icon(
              icon,
              size: 40,
              color: Colors.grey.shade800,
            ),
          ),
        ),
      ),
    );
  }
}
