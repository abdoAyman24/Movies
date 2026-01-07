import 'package:flutter/widgets.dart';
import 'package:movies/core/utils/app_text_styles.dart';

class CustomMoviesErrorWidget extends StatelessWidget {
  const CustomMoviesErrorWidget({
    super.key,
    required this.errorMessage,
    required this.icon,
  });
  final String errorMessage;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Icon(icon, size: 40),
          const SizedBox(height: 10),
          Text(errorMessage, style: AppText.bold19),
        ],
      ),
    );
  }
}
