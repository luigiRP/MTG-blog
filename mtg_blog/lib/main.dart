import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:mtg_blog/api/http_override.dart';
import 'package:mtg_blog/bloc/mtg_bloc.dart';
import 'package:mtg_blog/pages/card_blog.dart';
import 'package:mtg_blog/pages/card_description.dart';
import 'package:mtg_blog/pages/error_page.dart';
import 'package:mtg_blog/pages/user_form.dart';
import 'package:mtg_blog/ui/theme.dart';

void main() async {
  HttpOverrides.global = HttpOverride();
  runApp(const MTGBlogApp());
}

class MTGBlogApp extends StatelessWidget {
  const MTGBlogApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
            return UserForm(
                name: state.name,
                surname: state.surname,
                email: state.email,
                date: state.date);
          }
          if (state is LoadingState) {
            return WillPopScope(
              onWillPop: () async {
                context.read<MTGBloc>().add(const Initialize());
                return false;
              },
              child: Center(
                child: Transform.scale(
                    scale: 2, child: const CircularProgressIndicator()),
              ),
            );
          }
          if (state is CardBlogState) {
            return CardBlog(
              cards: state.cards,
            );
          }
          if (state is CardDescriptionState) {
            return CardDescriptionPage(card: state.card);
          }
          if (state is ErrorState) {
            return const ErrorPage();
          }
          return const UserForm();
        }),
      ),
    );
  }
}
