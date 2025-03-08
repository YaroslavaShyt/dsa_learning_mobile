import 'dart:io';

import 'package:flutter/material.dart';

class AvatarWidget extends StatelessWidget {
  const AvatarWidget({
    required this.size,
    required this.avatarPath,
    super.key,
  });

  final double size;
  final String avatarPath;

  @override
  Widget build(BuildContext context) {
    if (avatarPath.isEmpty) {
      return ClipOval(
        child: Container(
          height: size,
          width: size,
          color: Colors.grey,
          child: const Icon(Icons.person),
        ),
      );
    }
    return ClipOval(
      child: Image.file(
        height: size,
        width: size,
        File(
          avatarPath,
        ),
        fit: BoxFit.cover,
      ),
    );
  }
}
