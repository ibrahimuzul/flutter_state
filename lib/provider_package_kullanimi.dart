import 'package:flutter/material.dart';
import 'package:flutter_state/sayac.dart';
import 'package:provider/provider.dart';

class ProviderPackageKullanimi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /*1. yöntem */
    final mySayac = Provider.of<Sayac>(context);

    //2. yöntem Consumer widget
    return Consumer(
      builder: (context, Sayac mySayac2, widget) => Scaffold(
        appBar: AppBar(
          title: Text("Provider Package Kullanimi"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'You have pushed the button this many times:',
              ),
              Text(
                '${mySayac2.sayac}',
                style: Theme.of(context).textTheme.display1,
              ),
            ],
          ),
        ),
        floatingActionButton: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            FloatingActionButton(
              heroTag: "1",
              onPressed: () {
                mySayac.arttir();
              },
              child: Icon(Icons.add),
            ),
            SizedBox(
              height: 5,
            ),
            FloatingActionButton(
              heroTag: "2",
              onPressed: mySayac.azalt,
              child: Icon(Icons.remove),
            ),
          ],
        ),
      ),
    );
  }
}