import 'package:flutter/material.dart';
import 'package:mobile_ui/feed.dart';

class ContentPage extends StatelessWidget {
  const ContentPage({super.key});

  Widget contentWidget(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.all(screenWidth * 0.05),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.more_horiz_rounded),
            ),
          ),
          const SizedBox(height: 1),
          FractionallySizedBox(
            alignment: Alignment.center,
            widthFactor: 1.0,
            child: Container(
              color: const Color(0xFFF6F6F6),
              height: 315,
            ),
          ),
          const SizedBox(height: 20),
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Header',
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            "He'll want to use your yacht, and I don't want this thing smelling like fish.",
            style: TextStyle(
              fontSize: 18,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final fontSize = screenWidth * 0.1;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const SizedBox(height: 30),
          PreferredSize(
            preferredSize: const Size.fromHeight(70),
            child: AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              title: Text(
                'Content',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: fontSize,
                  fontWeight: FontWeight.bold,
                ),
              ),
              centerTitle: true,
              leading: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const FeedPage()),
                  );
                },
                child: const Text(
                  'Back',
                  style: TextStyle(
                    color: Color(0xFF5DB075),
                    fontSize: 18,
                  ),
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Filter',
                    style: TextStyle(
                      color: Color(0xFF5DB075),
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
              color: const Color(0xFFF6F6F6),
              borderRadius: BorderRadius.circular(40),
            ),
            child: const TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                border: InputBorder.none,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 20,
              physics: const ClampingScrollPhysics(),
              itemBuilder: (context, index) {
                return contentWidget(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}
