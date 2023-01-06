import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:mtg_blog/bloc/mtg_bloc.dart';
import 'package:mtg_blog/pages/card_blog.dart';
import 'package:mtg_blog/pages/user_form.dart';
import 'package:mtg_blog/ui/theme.dart';

void main() {
  runApp(const MTGBlogApp());
}

class MTGBlogApp extends StatelessWidget {
  const MTGBlogApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        AppLocalizations.delegate, // Add this line
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', ''),
        Locale('es', ''),
      ],
      theme: mainTheme,
      home: const MainWidget(),
    );
  }
}

class MainWidget extends StatelessWidget {
  const MainWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BlocProvider(
        create: (_) => MTGBloc(),
        child: BlocBuilder<MTGBloc, MTGState>(builder: (context, state) {
          if (state is InitialState) {
            return const UserForm();
          }
          if (state is LoadingState) {
            return Center(
              child: Transform.scale(
                  scale: 2, child: const CircularProgressIndicator()),
            );
          }
          if (state is CardBlogState) {
            return CardBlog(cards: state.cards);
          }
          return const UserForm();
        }),
      ),
    );
  }
}
