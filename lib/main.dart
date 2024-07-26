import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Temel MEsajlaşma Uygulaması",
      home: Iskele(),
    );
  }
}

class Iskele extends StatelessWidget {
  const Iskele({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mesajlaşma Uygulaması Arayüzü"),
      ),
      body: const AnaEkran(),
    );
  }
}

class AnaEkran extends StatefulWidget {
  const AnaEkran({super.key});

  @override
  State<AnaEkran> createState() => _AnaEkranState();
}

class _AnaEkranState extends State<AnaEkran> {
  TextEditingController t1 = TextEditingController();
  List mesajListesi = [];

  mesajlariEkle(String metin) {
    setState(() {
      mesajListesi.insert(0, metin);
      t1.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(40),
      child: Column(
        children: [
          Flexible(
            child: ListView.builder(
              reverse: true, //tersen sırlama
              itemCount: mesajListesi.length,
              itemBuilder: (context, int indeksNumarasi) =>
                  Text(mesajListesi[indeksNumarasi]),
            ),
          ),
          Row(
            children: [
              Flexible(child: TextField(
                controller: t1,
                onSubmitted: mesajlariEkle,//enter tuşu ile gönderme
              ),
              ),
              ElevatedButton(
                  onPressed: mesajlariEkle(t1.text), child: const Text("Gönder")),
            ],
          ),
        ],
      ),
    );
  }
}
