import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "MhatsApp Messenger",
      home: Iskele(),
    );
  }
}

class Iskele extends StatelessWidget {
  const Iskele({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("MhatsApp"),
      ),
      body: AnaEkran(),
    );
  }
}

class AnaEkran extends StatefulWidget {
  const AnaEkran({Key? key}) : super(key: key);

  @override
  State<AnaEkran> createState() => _AnaEkranState();
}

class _AnaEkranState extends State<AnaEkran> {
  List mesajListesi = [];
  TextEditingController t1 = TextEditingController();
  MesajEkle(String metin) {
    setState(() {
      mesajListesi.insert(0, metin);
      t1.clear();
      t1.selection;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(30.0),
      child: Column(
        children: [
          Flexible(
            child: ListView.builder(
              reverse: true,
              itemCount: mesajListesi.length,
              itemBuilder: (
                context,
                indeksnumarasi,
              ) =>
                  Text(mesajListesi[indeksnumarasi]),
            ),
          ),
          Row(
            children: [
              Flexible(
                child: TextField(onSubmitted: MesajEkle, controller: t1),
              ),
              ElevatedButton(
                onPressed: MesajEkle(t1.text),
                child: Text("Mesaj Gönder"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
