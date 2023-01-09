import 'package:flutter/material.dart';
import 'package:mtg_blog/ui/text_styles.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar(
      {super.key, required this.title, required this.onPressedHandle});

  final String title;
  final Function onPressedHandle;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: true,
      leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => onPressedHandle()),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: Container(
            height: MediaQuery.of(context).size.width * 0.07,
            width: MediaQuery.of(context).size.width * 0.07,
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fitWidth,
                image: AssetImage('lib/assets/images/mtg_icon.png'),
              ),
            ),
          ),
        ),
      ],
      title: Text(
        title,
        style: appBarTitle,
      ),
      centerTitle: true,
    );
  }
}
