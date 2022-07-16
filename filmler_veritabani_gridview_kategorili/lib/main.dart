import 'package:filmler_veritabani_gridview_kategorili/classlar.dart';
import 'package:filmler_veritabani_gridview_kategorili/filmler.dart';
import 'package:filmler_veritabani_gridview_kategorili/filmler_dao.dart';
import 'package:filmler_veritabani_gridview_kategorili/veri_tabani_yardimcisi.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Veritabanlı Filmler Uygulaması',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<List<Kategoriler>> kategorileriGetir() async {
    var kategoriListe = FilmlerDAO().kategorileriGoster();
    return kategoriListe;
  }

  @override
  Widget build(BuildContext context) {
    var ekranolc = MediaQuery.of(context).size;
    var ekranyuk = ekranolc.height;
    var ekrangen = ekranolc.width;
    return Scaffold(
        appBar: AppBar(
          title: Text("Kategoriler"),
        ),
        body: FutureBuilder<List<Kategoriler>>(
          future: kategorileriGetir(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var liste = snapshot.data!;
              return ListView.builder(
                itemBuilder: (context, index) {
                  return SizedBox(
                    height: ekranyuk / 12,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => FilmlerPage(liste[index]),));
                      },
                      child: Card(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              liste[index].kategori_ad.toString(),
                              style: TextStyle(fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                itemCount: liste.length,
              );
            } else {
              return Center();
            }
          },
        ));
  }
}
