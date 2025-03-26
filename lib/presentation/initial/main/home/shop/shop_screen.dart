import 'package:flutter/material.dart';

class ShopScreen extends StatelessWidget {
  const ShopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const SizedBox.shrink(),
            Text('my shop'),
            CloseButton(),
          ],
        )
      ],
    );
  }
}
