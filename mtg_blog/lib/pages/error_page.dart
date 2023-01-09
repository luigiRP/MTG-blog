import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mtg_blog/bloc/mtg_bloc.dart';
import 'package:mtg_blog/ui/buttons/main_gradient_button.dart';
import 'package:mtg_blog/ui/text_styles.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                AppLocalizations.of(context)!.error,
                style: title1,
              ),
              const SizedBox(height: 30),
              Text(
                textAlign: TextAlign.center,
                AppLocalizations.of(context)!.error_description,
                style: title2,
              ),
              const SizedBox(height: 30),
              SizedBox(
                  height: 50,
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: MainGradientButton(
                      onPressed: () {
                        context.read<MTGBloc>().add(const Initialize());
                      },
                      text: AppLocalizations.of(context)!.accept))
            ]),
      ),
    );
  }
}
