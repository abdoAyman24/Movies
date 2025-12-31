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
    this.confirmPassword,
    this.textEditingController,
    this.textColor = Colors.black,
  });

  final String hint;
  final ValueChanged onSave;
  final Icon preffixIcon;
  final bool showSuffixIcon;
  final TextInputType keyboardType;
  final Color textFormColor;
  final Color textColor;

  final TextEditingController? confirmPassword;
  final TextEditingController? textEditingController;
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
            controller: widget.textEditingController,
            onChanged: widget.onSave,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Field is Empty ';
              }
              if (widget.confirmPassword != null) {
                if (value != widget.confirmPassword!.text) {
                  return 'Passwords do not match.';
                }
              }
              return null;
            },
            style: TextStyle(color: widget.textColor),
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
