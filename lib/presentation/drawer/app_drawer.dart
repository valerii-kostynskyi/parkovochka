import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parkovochka/bloc/local/bloc/local_bloc.dart';
import 'package:parkovochka/bloc/theme/theme_bloc.dart';
import 'package:parkovochka/presentation/widgets/button_widget.dart';
import 'package:parkovochka/presentation/widgets/svg_icon_widget.dart';
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
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.3,
                    child: DrawerHeader(
                      decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primary),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            AppLocalizations.of(context)
                                .translations['sign_in']!
                                .capitalizeFirst(),
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                          const SizedBox(height: 16),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                _authButton(
                                  context,
                                  onTap: () {},
                                  icon: 'google',
                                ),
                                const SizedBox(width: 8),
                                _authButton(
                                  context,
                                  onTap: () {},
                                  icon: 'facebook',
                                ),
                                const SizedBox(width: 8),
                                _authButton(
                                  context,
                                  onTap: () {},
                                  icon: 'apple',
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onBackground,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            AppLocalizations.of(context)
                                .translations['auth_pls']!
                                .capitalizeFirst(),
                            style: Theme.of(context)
                                .textTheme
                                .labelSmall!
                                .copyWith(fontSize: 10),
                          ),
                        ],
                      ),
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
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: DropdownButton<Locale>(
                        dropdownColor: Theme.of(context).colorScheme.background,
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

  Widget _authButton(
    BuildContext context, {
    required void Function()? onTap,
    required String icon,
    Color? color,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 60,
        height: 60,
        padding: const EdgeInsets.symmetric(
          horizontal: 12.0,
          vertical: 5.0,
        ),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.background,
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Center(
          child: SizedBox(
            width: 30,
            height: 30,
            child: SVGIconWidget(
              icon: icon,
              color: color,
            ),
          ),
        ),
      ),
    );
  }
}
