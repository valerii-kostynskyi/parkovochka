import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parkovochka/bloc/local/bloc/local_bloc.dart';
import 'package:parkovochka/bloc/theme/theme_bloc.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final localeBloc = BlocProvider.of<LocaleBloc>(context);
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.5,
      child: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration:
                  BoxDecoration(color: Theme.of(context).colorScheme.primary),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 50,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'John Doe',
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.palette, color: Colors.blue),
              title: Text(
                'Change Theme',
                style: TextStyle(fontSize: 16),
              ),
              onTap: () => context.read<ThemeBloc>().add(
                    ThemeToggled(),
                  ),
            ),
            ListTile(
              leading: Icon(Icons.language, color: Colors.blue),
              title: Text(
                'English',
                style: TextStyle(fontSize: 16),
              ),
              onTap: () {
                localeBloc.add(
                  ChangeLocaleEvent(
                    Locale('en', 'US'),
                  ),
                );
                Navigator.pop(context); // Close the drawer
              },
            ),
            ListTile(
              leading: Icon(Icons.language, color: Colors.blue),
              title: Text(
                'Українська',
                style: TextStyle(fontSize: 16),
              ),
              onTap: () {
                localeBloc.add(
                  ChangeLocaleEvent(
                    Locale('uk', 'UA'),
                  ),
                );
                Navigator.pop(context); // Close the drawer
              },
            ),
          ],
        ),
      ),
    );
  }
}
