import 'package:flutter/material.dart';
import 'package:flutter_app_fiap/screens/home/domain/entities/book_topics_entity.dart';
import 'package:flutter_app_fiap/widgets/preview_book_list.dart';

class HomeScreen extends StatelessWidget {
  static const String id = '/home_screen';

  const HomeScreen({
    super.key,
    required this.onLogout,
    required this.bookTopics,
  });

  final Function() onLogout;
  final BookTopicsEntity bookTopics;

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
        body: SafeArea(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: <Widget>[
                const Text(
                  'Open Books',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Descubra livros gratuitos',
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(Colors.grey.shade700.value),
                    fontStyle: FontStyle.italic,
                  ),
                ),
                const SizedBox(height: 24),
                PreviewBookList(
                  title: 'Romances',
                  books: bookTopics.romance,
                ),
                const SizedBox(height: 24),
                PreviewBookList(
                  title: 'Poesia',
                  books: bookTopics.poetry,
                ),
                const SizedBox(height: 24),
                PreviewBookList(
                  title: 'Infantil',
                  books: bookTopics.children,
                ),
              ],
            ),
          ),
        ));
  }
}
