import 'package:flutter/material.dart';
import 'package:movies/core/utils/app_text_styles.dart';
import 'package:movies/core/utils/container_decoration.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.onTap, required this.text ,this.isLoding=false} );

  final void Function()? onTap;
  final String text;
  final bool isLoding;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        decoration: containerDecration(20),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: Center(child:isLoding? CircularProgressIndicator(color: Colors.white,): Text(text, style: AppText.bold20)),
        ),
      ),
    );
  }
}
