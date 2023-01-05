import 'package:flutter/material.dart';
import 'package:mtg_blog/ui/text_styles.dart';

class MainGradientButton extends StatelessWidget {
  const MainGradientButton(
      {super.key, required this.onPressed, required this.text});
  final Function onPressed;
  final String text;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => onPressed(),
      style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent, shadowColor: Colors.transparent),
      child: Ink(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            border: Border.all(
                color: Theme.of(context).colorScheme.primary, width: 2),
            color: Theme.of(context).colorScheme.secondary,
            borderRadius: BorderRadius.circular(10)),
        child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Align(
              alignment: Alignment.center,
              child: Text(
                text,
                style: buttonWhite,
              ),
            )),
      ),
    );
  }
}
