import 'package:flutter/material.dart';
import 'package:mobile_ui/content.dart';
import 'package:mobile_ui/signup.dart';

class FeedPage extends StatelessWidget {
  const FeedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 30),
            PreferredSize(
              preferredSize: const Size.fromHeight(70),
              child: AppBar(
                backgroundColor: Colors.white,
                elevation: 0,
                title: const Text(
                  'Feed',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                centerTitle: true,
                leading: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SignUpPage()),
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
            const SizedBox(height: 30),
            Expanded(
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: 20,
                itemBuilder: (context, index) {
                  return const FeedItem();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FeedItem extends StatelessWidget {
  const FeedItem({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ContentPage()),
        );
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: const Color(0xFFF6F6F6),
            height: 70,
            width: 70,
          ),
          const SizedBox(width: 10),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Header',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '8m ago',
                      style: TextStyle(
                        fontSize: 13,
                        color: Color(0xFFBDBDBD),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 5),
                Text(
                  "He'll want to use your yacht, and I don't want this thing smelling like fish.",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 10),
                Divider(
                  color: Colors.grey,
                  thickness: 1,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
