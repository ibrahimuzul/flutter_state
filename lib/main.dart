import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_state/auth_service.dart';
import 'package:flutter_state/counter.dart';
import 'package:flutter_state/sayac_with_provider.dart';
import 'package:flutter_state/stream_kullanimi.dart';
import 'package:provider/provider.dart';

import 'bloc_kullanimi.dart';

//import 'bloc_kullanimi.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
                color: Colors.blue,
                child: Text("Provider ile Sayac App"),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => MultiProvider(
                        providers: [
                          ChangeNotifierProvider(
                            create: (_) => Counter(5),
                          ),
                          ChangeNotifierProvider(
                            create: (_) => AuthService(),
                          ),
                        ],
                        child: ProviderlaSayacUygulamasi(),
                      ),
                    ),
                  );
                }),
            RaisedButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => StreamKullanimi()));
              },
              child: Text("Stream Kullanımı"),
              color: Colors.yellow,
            ),
            RaisedButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => BlocKullanimi()));
              },
              child: Text("Bloc Kullanımı"),
              color: Colors.green,
            ),
          ],
        ),
      ),
    );
  }
}















/*import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_state/provider_package_kullanimi.dart';
import 'package:flutter_state/sayac.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<Sayac>(
          create: (context) => Sayac(0),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("idget.title"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "You have pushed the button this many times:",
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
            RaisedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ProviderPackageKullanimi()));
              },
              child: Text("Provider Package"),
              color: Colors.blue,
            ),
          ],
        ),
      ),
      floatingActionButton: MyButton(_incrementCounter),
    );
  }
}

class MyButton extends StatefulWidget {
  Function incrementCounter;

  MyButton(this.incrementCounter);

  @override
  _MyButtonState createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: widget.incrementCounter,
      tooltip: 'Increment',
      child: Icon(Icons.add),
    );
  }
}
*/