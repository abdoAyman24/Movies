import 'package:flutter/material.dart';
import 'package:movies/core/utils/app_color.dart';
import 'package:movies/core/utils/app_text_styles.dart';

class CustomTextForm extends StatefulWidget {
  const CustomTextForm({
    super.key,

    required this.hint,
    required this.onSave,
    this.showSuffixIcon = false,
    required this.keyboardType,
    required this.textFormColor,
    required this.preffixIcon,
  });

  final String hint;
  final ValueChanged onSave;
  final Icon preffixIcon;
  final bool showSuffixIcon;
  final TextInputType keyboardType;
  final Color textFormColor;

  @override
  State<CustomTextForm> createState() => _CustomTextFormState();
}

class _CustomTextFormState extends State<CustomTextForm> {
  bool showPasword = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 8),
          TextFormField(
            onChanged: widget.onSave,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Field is Empty ';
              }
              return null;
            },
            style: TextStyle(color: AppColor.black),
            keyboardType: widget.keyboardType,
            obscureText: !widget.showSuffixIcon
                ? false
                : showPasword
                ? false
                : true,
            decoration: InputDecoration(
              filled: true,
              fillColor: widget.textFormColor,
              prefixIconColor: AppColor.primary,
              prefixIcon: widget.preffixIcon,
              suffixIcon: widget.showSuffixIcon
                  ? IconButton(
                      onPressed: () {
                        showPasword = !showPasword;
                        setState(() {});
                      },
                      icon: Icon(
                        showPasword
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined,
                        color: AppColor.primary,
                      ),
                    )
                  : null,
              hint: Text(widget.hint, style: AppText.semiBold16),
            ),
          ),
        ],
      ),
    );
  }
}
