import 'package:flutter/material.dart';

class ButtonCustom extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;

  const ButtonCustom({
    super.key,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return IconButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: theme.colorScheme.primary,
        foregroundColor: theme.colorScheme.onPrimary,
        shape: CircleBorder(),
        padding: EdgeInsets.all(15)
      ),
      onPressed: onPressed,
      icon: Icon(icon, size: 30,),
    );
  }
}
