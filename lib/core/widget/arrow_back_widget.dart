import 'package:flutter/material.dart';

class ArrowBackWidget extends StatelessWidget {
  const ArrowBackWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 10,
      height: 100,
      child: Row(
        children: [
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back_ios_new, size: 30),
          ),
        ],
      ),
    );
  }
}
