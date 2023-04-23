import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static const String id = '/home_screen';

  const HomeScreen({
    super.key,
    required this.onLogout,
  });

  final Function() onLogout;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Theme.of(context).primaryColor,
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        drawer: Drawer(
          // Add a ListView to the drawer. This ensures the user can scroll
          // through the options in the drawer if there isn't enough vertical
          // space to fit everything.
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                ),
                child: Text(''),
              ),
              ListTile(
                leading: IconButton(
                  icon: const Icon(Icons.logout),
                  onPressed: onLogout,
                ),
                title: const Text('Sair'),
                onTap: onLogout,
              ),
            ],
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const <Widget>[
              Text(
                'Home',
              ),
            ],
          ),
        ));
  }
}
