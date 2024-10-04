import 'package:flutter/material.dart';
import 'package:graphql_example/presentation/pages/item_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const ItemPage()));
            },
            child: const Text("Country Page")),
      ),
    );
  }
}
