import 'package:flutter/material.dart';

class CircularSocialMediaButton extends StatelessWidget {
  final void Function() onTap;

  const CircularSocialMediaButton({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 42,
      height: 42,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: Colors.black,
          width: 1,
        ),
      ),
      child: IconButton(
        onPressed: onTap,
        icon: Transform.scale(
          scale: 1.6,
          child: Image.asset(
            'assets/icons/google.png',
          ),
        ),
      ),
    );
  }
}
