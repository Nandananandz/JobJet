import 'package:flutter/material.dart';
import 'package:jobjet/Screens/Views/components/Searchbar.dart';


class ViewScreen extends StatelessWidget {
  const ViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SearchScreen()
           
          ],
        ),
      ),
    );
  }
}