import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final appTitle = 'Drawer Demo';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appTitle,
      home: MyHomePage(title: appTitle),
      theme: ThemeData(
        primaryColor: const Color(0xFF6200EE),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;

  const MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedDestination = 0;
  var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return SafeArea(
      child: Scaffold(
        key: scaffoldKey,
        // appBar: AppBar(
        //   title: Text(widget.title),
        // ),
        drawer: Drawer(
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Header',
                  style: textTheme.headline6,
                ),
              ),
              Divider(
                height: 1,
                thickness: 1,
              ),
              ListTile(
                leading: Icon(Icons.favorite),
                title: Text('Item 1'),
                selected: _selectedDestination == 0,
                onTap: () => selectDestination(0),
              ),
              ListTile(
                leading: Icon(Icons.delete),
                title: Text('Item 2'),
                selected: _selectedDestination == 1,
                onTap: () => selectDestination(1),
              ),
              ListTile(
                leading: Icon(Icons.label),
                title: Text('Item 3'),
                selected: _selectedDestination == 2,
                onTap: () => selectDestination(2),
              ),
              const Divider(
                height: 1,
                thickness: 1,
              ),
              const Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Label',
                ),
              ),
              ListTile(
                leading: Icon(Icons.bookmark),
                title: Text('Item A'),
                selected: _selectedDestination == 3,
                onTap: () => selectDestination(3),
              ),
            ],
          ),
        ),
        body: const Center(
          child: Text("Home page"),
        ),
        bottomNavigationBar: BottomAppBar(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () => scaffoldKey.currentState!.openDrawer(),
                icon: Icon(Icons.menu),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.person),
              )
            ],
          ),
        ),
      ),
    );
  }

  void selectDestination(int index) {
    setState(() {
      _selectedDestination = index;
    });
  }
}
