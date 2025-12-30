import 'package:flutter/material.dart';
import 'package:movies/core/utils/app_color.dart';
import 'package:movies/core/widget/custom_back_ground.dart';
import 'package:movies/core/widget/custom_text_form_field.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomBackGround(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    CustomTextForm(
                      hint: 'Search',
                      onSave: (value) {},
                      keyboardType: TextInputType.text,
                      textFormColor: AppColor.black,
                      preffixIcon: Icon(Icons.search_rounded),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
