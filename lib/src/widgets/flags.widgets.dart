import 'package:flutter/material.dart';

class FlagsWidget<T> extends StatelessWidget {
  final T value;
  final T groupValue;
  final String imgSrc;
  final ValueChanged<T?> onChanged;

  const FlagsWidget({
    super.key,
    required this.value,
    required this.imgSrc,
    required this.groupValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onChanged(value),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            _customRadioButton,
          ],
        ),
      ),
    );
  }

  Widget get _customRadioButton {
    final isSelected = value == groupValue;
    return Container(
        height: 101,
        width: 101,
        decoration: BoxDecoration(
          border: Border.all(
              width: 5,
              color: isSelected ? const Color(0xff6F2D48) : Colors.transparent),
          borderRadius: BorderRadius.circular(100),
        ),
        child: Image.asset(imgSrc));
  }
}
