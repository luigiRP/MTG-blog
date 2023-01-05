import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mtg_blog/bloc/mtg_bloc.dart';
import 'package:mtg_blog/ui/buttons/main_gradient_button.dart';
import 'package:mtg_blog/ui/text_styles.dart';

class UserForm extends StatefulWidget {
  const UserForm({super.key, this.date, this.name, this.surname, this.email});

  final String? name;
  final String? surname;
  final String? email;
  final DateTime? date;

  @override
  State<UserForm> createState() => _UserFormState();
}

class _UserFormState extends State<UserForm> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController name = TextEditingController();
  final TextEditingController surname = TextEditingController();
  final TextEditingController email = TextEditingController();
  DateTime date = DateTime.now();

  @override
  void initState() {
    if (widget.name != null) {
      name.text = widget.name!;
    }
    if (widget.surname != null) {
      surname.text = widget.surname!;
    }
    if (widget.email != null) {
      email.text = widget.email!;
    }
    if (widget.date != null) {
      date = widget.date!;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: MediaQuery.of(context).size.width * 0.7,
              width: MediaQuery.of(context).size.width * 0.7,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fitWidth,
                  image: AssetImage('lib/assets/images/mtg_logo.png'),
                ),
              ),
            ),
            Form(
              key: formKey,
              child: Align(
                alignment: Alignment.topCenter,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: Container(
                      padding: const EdgeInsets.only(
                          left: 20.0, right: 20, top: 20, bottom: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          TextFormField(
                            initialValue: widget.name,
                            controller: name,
                            validator: (value) {
                              if (value == null || value == '') {
                                return AppLocalizations.of(context)!.empty_name;
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                                labelText: AppLocalizations.of(context)!.name),
                          ),
                          TextFormField(
                            initialValue: widget.surname,
                            controller: surname,
                            validator: (value) {
                              if (value == null || value == '') {
                                return AppLocalizations.of(context)!
                                    .empty_surname;
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                                labelText:
                                    AppLocalizations.of(context)!.surname),
                          ),
                          TextFormField(
                            initialValue: widget.email,
                            controller: email,
                            validator: (value) {
                              if (value == null || value == '') {
                                return AppLocalizations.of(context)!
                                    .empty_email;
                              } else {
                                bool emailValid = RegExp(
                                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                    .hasMatch(value);
                                if (!emailValid) {
                                  return AppLocalizations.of(context)!
                                      .invalid_email;
                                }
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                                labelText: AppLocalizations.of(context)!.email),
                          ),
                          const SizedBox(height: 20),
                          Text(
                            '${AppLocalizations.of(context)!.test_date}: ${date.day}/${date.month}/${date.year}',
                            style: description1,
                          ),
                          const SizedBox(height: 20),
                          SizedBox(
                            height: 30,
                            child: ElevatedButton(
                                onPressed: () async {
                                  DateTime? newDate = await showDatePicker(
                                      context: context,
                                      initialDate: widget.date ?? date,
                                      firstDate: DateTime(2022),
                                      lastDate: DateTime(2100));
                                  if (newDate == null) {
                                    return;
                                  } else {
                                    setState(() {
                                      date = newDate;
                                    });
                                  }
                                },
                                child: Text(
                                  AppLocalizations.of(context)!.change_date,
                                  style: buttonWhite,
                                )),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            SizedBox(
              height: 50,
              width: MediaQuery.of(context).size.width * 0.7,
              child: MainGradientButton(
                  onPressed: () {
                    final isValidForm = formKey.currentState!.validate();
                    if (isValidForm) {
                      context.read<MTGBloc>().add(LoadData(
                          name: name.text,
                          surname: surname.text,
                          email: email.text,
                          date: date));
                    }
                  },
                  text: AppLocalizations.of(context)!.next),
            ),
            SizedBox(
              height: MediaQuery.of(context).viewInsets.bottom,
            )
          ],
        ),
      ),
    );
  }
}
