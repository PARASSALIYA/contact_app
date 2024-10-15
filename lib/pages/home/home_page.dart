import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff384e78),
        foregroundColor: Colors.white,
        leading: const Icon(Icons.menu),
        centerTitle: true,
        title: const Text('Contact App'),
      ),
      body: const Center(
        child: Text(
          'Home Page',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        foregroundColor: Colors.white,
        backgroundColor: const Color(0xff384e78),
        onPressed: () {
          Navigator.pushNamed(context, "/contact");
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
