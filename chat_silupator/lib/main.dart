import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  List<int> lista = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: [
          for (int i in lista)
            const ListTile(
              trailing: Icon(Icons.drag_handle),
              leading: CircleAvatar(
                radius: 25,
                backgroundImage:
                    NetworkImage('https://i.pravatar.cc/150?img=43'),
              ),
              title: Text('Valeria Cinquetti'),
              subtitle: Text('Hey sono nuovo qui!'),
            )
        ],
      ),
      bottomNavigationBar: Builder(builder: (context) {
        return AppBar();
      },),
    );
  } // non mi salva i commit
}
