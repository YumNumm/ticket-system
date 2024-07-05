import 'package:flutter/material.dart';

class AdaptiveSizedBox extends StatelessWidget {
  const AdaptiveSizedBox({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final isLargeScreen = size.width > 600;
    return Center(
      child: SizedBox(
        width: isLargeScreen ? 600 : null,
        child: child,
      ),
    );
  }
}
