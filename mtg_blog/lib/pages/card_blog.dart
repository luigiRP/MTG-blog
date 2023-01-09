import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mtg_blog/bloc/mtg_bloc.dart';
import 'package:mtg_blog/models/card_list_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mtg_blog/models/card_model.dart';
import 'package:mtg_blog/ui/widgets/app_bar.dart';

class CardBlog extends StatelessWidget {
  const CardBlog({super.key, required this.cards});

  final CardList cards;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: WillPopScope(
        onWillPop: (() async {
          context.read<MTGBloc>().add(const Initialize());
          return false;
        }),
        child: CustomScrollView(physics: const ScrollPhysics(), slivers: [
          CustomAppBar(
              title: AppLocalizations.of(context)!.card_blog,
              onPressedHandle: () {
                context.read<MTGBloc>().add(const Initialize());
              }),
          _CardList(cards: cards.cards)
        ]),
      ),
    );
  }
}

class _CardList extends StatelessWidget {
  const _CardList({required this.cards});

  final List<MTGCard> cards;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(childCount: cards.length,
          (context, index) {
        MTGCard card = cards[index];
        late Widget iconImage;

        if (card.imageUrl == null) {
          iconImage = Container(
            height: MediaQuery.of(context).size.width * 0.2,
            width: MediaQuery.of(context).size.width * 0.05,
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

        return ListTile(
            title: Text(card.name),
            subtitle: Text(card.type),
            trailing: iconImage);
      }),
    );
  }
}
