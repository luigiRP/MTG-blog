import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mtg_blog/bloc/mtg_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mtg_blog/models/card_model.dart';
import 'package:mtg_blog/ui/widgets/app_bar.dart';

class CardDescriptionPage extends StatelessWidget {
  const CardDescriptionPage({super.key, required this.card});

  final MTGCard card;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: WillPopScope(
        onWillPop: (() async {
          context.read<MTGBloc>().add(const LoadCards());
          return false;
        }),
        child: CustomScrollView(physics: const ScrollPhysics(), slivers: [
          CustomAppBar(
              title: AppLocalizations.of(context)!.card_description,
              onPressedHandle: () {
                context.read<MTGBloc>().add(const LoadCards());
              }),
        ]),
      ),
    );
  }
}
