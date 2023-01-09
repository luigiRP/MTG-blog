import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mtg_blog/bloc/mtg_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mtg_blog/models/card_model.dart';
import 'package:mtg_blog/ui/text_styles.dart';
import 'package:mtg_blog/ui/widgets/app_bar.dart';

class CardDescriptionPage extends StatelessWidget {
  const CardDescriptionPage({super.key, required this.card});

  final MTGCard card;

  @override
  Widget build(BuildContext context) {
    late Widget iconImage;

    if (card.imageUrl == null) {
      iconImage = Container(
        height: MediaQuery.of(context).size.height * 0.5,
        width: MediaQuery.of(context).size.width * 0.2,
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fitWidth,
            image: AssetImage('lib/assets/images/mtg_icon.png'),
          ),
        ),
      );
    } else {
      iconImage = Image.network(card.imageUrl!);
    }
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
          SliverList(
            delegate:
                SliverChildBuilderDelegate((BuildContext context, int index) {
              return Center(
                child: Text(
                  card.name,
                  style: title1,
                ),
              );
            }, childCount: 1),
          ),
          const SliverPadding(padding: EdgeInsets.only(top: 20)),
          SliverList(
            delegate:
                SliverChildBuilderDelegate((BuildContext context, int index) {
              return Center(
                child: Text(
                  card.type,
                  style: title2,
                ),
              );
            }, childCount: 1),
          ),
          const SliverPadding(padding: EdgeInsets.only(top: 50)),
          SliverList(
            delegate:
                SliverChildBuilderDelegate((BuildContext context, int index) {
              return Center(child: iconImage);
            }, childCount: 1),
          ),
          const SliverPadding(padding: EdgeInsets.only(top: 30)),
          SliverList(
            delegate:
                SliverChildBuilderDelegate((BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.all(10),
                child: Center(
                  child: Text(
                    card.text,
                    style: description2,
                  ),
                ),
              );
            }, childCount: 1),
          ),
        ]),
      ),
    );
  }
}
