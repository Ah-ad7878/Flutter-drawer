import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(const NameBar());
}

class NameBar extends StatelessWidget {
  const NameBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Drawer practice",
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        leading: IconButton(
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer();
          },
          icon: const Icon(Icons.menu),
          color: Colors.white,
        ),
        title: const Center(
          child: Text(
            "Drawer",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),

      // 3. Main body content
      body: const Center(
        child: Text(
          "Home Page Content",
          style: TextStyle(color: Colors.black, fontSize: 16),
        ),
      ),

      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.tealAccent),
              child: Row(
                children: [
                  FaIcon(FontAwesomeIcons.youtube, color: Colors.red),
                  SizedBox(width: 9),
                  Text(
                    "Youtube",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            _listTile("Home", Icons.home),
            SizedBox(height: 9),
            _listTile("Setting", Icons.settings),
            SizedBox(height: 9),
            _listTile("Subscriptions", Icons.subscriptions),
            SizedBox(height: 9),
            _listTile("Upload", Icons.video_call),
          ],
        ),
      ),
    );
  }

  Widget _listTile(String name, IconData icondata) {
    return ListTile(
      leading: Icon(icondata),
      title: Text(name),
      onTap: () {
        _scaffoldKey.currentState?.closeDrawer();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("$name page Open"),
            duration: Duration(milliseconds: 400),
            backgroundColor: Colors.green,
          ),
        );
      },
    );
  }
}
