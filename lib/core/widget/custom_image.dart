import 'package:flutter/widgets.dart';

class CustomImage extends StatelessWidget {
  const CustomImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset('assets/images/movies.png');
  }
}