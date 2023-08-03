import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parkovochka/bloc/local/bloc/local_bloc.dart';
import 'package:parkovochka/bloc/theme/theme_bloc.dart';
import 'package:parkovochka/style/theme.dart';
import 'package:parkovochka/util/langs/app_localizations.dart';
import 'package:parkovochka/util/string_extention.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final localeBloc = BlocProvider.of<LocaleBloc>(context);
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        return Container(
          width: MediaQuery.of(context).size.width * 0.9,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.background,
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(24),
              bottomRight: Radius.circular(24),
            ),
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(24),
              bottomRight: Radius.circular(24),
            ),
            child: Drawer(
              child: ListView(
                padding: EdgeInsets.zero,
                children: <Widget>[
                  DrawerHeader(
                    decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          AppLocalizations.of(context)
                              .translations['auth_pls']!
                              .capitalizeFirst(),
                          style: Theme.of(context).textTheme.displayMedium,
                        ),
                      ],
                    ),
                  ),
                  ListTile(
                    title: Text(
                      AppLocalizations.of(context)
                          .translations['dark_theme']!
                          .capitalizeFirst(),
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                    trailing: BlocBuilder<ThemeBloc, ThemeState>(
                      builder: (context, state) {
                        return CupertinoSwitch(
                          value: state.themeData == darkTheme,
                          activeColor: state.themeData.colorScheme.primary,
                          trackColor: state.themeData.colorScheme.surface,
                          onChanged: (bool value) {
                            context.read<ThemeBloc>().add(ThemeToggled());
                          },
                        );
                      },
                    ),
                  ),
                  ListTile(
                    title: SizedBox(
                      width: 150,
                      child: DropdownButton<Locale>(
                        isExpanded: true,
                        icon: const Icon(Icons.arrow_drop_down),
                        items: [
                          DropdownMenuItem(
                            value: const Locale('en', 'US'),
                            child: Row(
                              children: [
                                const Icon(Icons.language),
                                const SizedBox(width: 8),
                                Text(
                                  'English',
                                  style:
                                      Theme.of(context).textTheme.displayMedium,
                                ),
                              ],
                            ),
                          ),
                          DropdownMenuItem(
                            value: const Locale('uk', 'UA'),
                            child: Row(
                              children: [
                                const Icon(Icons.language),
                                const SizedBox(width: 8),
                                Text(
                                  'Українська',
                                  style:
                                      Theme.of(context).textTheme.displayMedium,
                                ),
                              ],
                            ),
                          ),
                        ],
                        onChanged: (v) {
                          if (v != null) {
                            localeBloc.add(
                              ChangeLocaleEvent(
                                v,
                              ),
                            );
                            // Navigator.pop(context);
                          }
                        },
                        value: localeBloc.state,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
