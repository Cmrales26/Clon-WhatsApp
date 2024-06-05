// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:whastsapp/Pages/ChatPages.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(vsync: this, length: 4, initialIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text(
          "Whatsapp",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.camera_alt_outlined,
              color: Colors.white,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
              color: Colors.white,
            ),
          ),
          PopupMenuButton<String>(
              onSelected: (value) {
                print(value);
              },
              icon: const Icon(
                Icons.more_vert,
                color: Colors.white,
              ),
              color: Theme.of(context).primaryColor,
              itemBuilder: (BuildContext context) {
                return const [
                  PopupMenuItem(
                    value: "New group",
                    child: Text(
                      "New group",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  PopupMenuItem(
                    value: "New Broadcast",
                    child: Text(
                      "New Broadcast",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  PopupMenuItem(
                    value: "Whatsapp Web",
                    child: Text(
                      "Whatsapp Web",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  PopupMenuItem(
                    value: "Started messages",
                    child: Text(
                      "Started messages",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  PopupMenuItem(
                    value: "Settings",
                    child: Text(
                      "Settings",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ];
              }),
        ],
      ),
      body: TabBarView(
        controller: _controller,
        children: const [
          ChatPage(),
          Text("Status"),
          Text("Communities"),
          Text("Calls"),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Theme.of(context).primaryColor,
        padding: const EdgeInsets.all(0),
        child: TabBar(
          indicator: const BoxDecoration(),
          controller: _controller,
          tabs: const [
            Tab(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.chat,
                    size: 24.0,
                    color: Colors.white,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "CHATS",
                    style: TextStyle(color: Colors.white, fontSize: 12.0),
                  ),
                ],
              ),
            ),
            Tab(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.cyclone_outlined,
                    size: 24.0,
                    color: Colors.white,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "STATUS",
                    style: TextStyle(color: Colors.white, fontSize: 12.0),
                  ),
                ],
              ),
            ),
            Tab(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.group_outlined,
                    size: 24.0,
                    color: Colors.white,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "COMMUNITY",
                    style: TextStyle(color: Colors.white, fontSize: 12.0),
                  ),
                ],
              ),
            ),
            Tab(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.phone,
                    size: 24.0,
                    color: Colors.white,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "CALLS",
                    style: TextStyle(color: Colors.white, fontSize: 12.0),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
