import 'package:filmler_veritabani_gridview_kategorili/filmler_dao.dart';
import 'package:filmler_veritabani_gridview_kategorili/secilen_film.dart';
import 'package:flutter/material.dart';

import 'classlar.dart';

class FilmlerPage extends StatefulWidget {
  Kategoriler? secilmiskategori;
  FilmlerPage(this.secilmiskategori);
  @override
  State<FilmlerPage> createState() => _FilmlerPageState();
}

class _FilmlerPageState extends State<FilmlerPage> {
  Future<List<Filmler>> belirliKategoridenGetir(
      {required int kategori_id}) async {
    var liste = FilmlerDAO().belirliKategoridenGetir(kategori_id);
    return liste;
  }

  @override
  Widget build(BuildContext context) {
    var ekranolc = MediaQuery.of(context).size;
    var ekranyuk = ekranolc.height;
    var ekrangen = ekranolc.width;
    return Scaffold(
        appBar: AppBar(
          title: Text("Kategori: ${widget.secilmiskategori?.kategori_ad}"),
        ),
        body: FutureBuilder<List<Filmler>>(
          future: belirliKategoridenGetir(
              kategori_id: widget.secilmiskategori!.kategori_id!),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var liste = snapshot.data!;
              return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 2/3
                  ),
                  itemCount: liste.length,
                  itemBuilder: (context, indeks) {
                    return GestureDetector(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                SecilenFilm(film: liste[indeks]),
                          )),
                      child: Card(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(
                                width: ekrangen / 4,
                                child: Image.asset(
                                    "assets/${liste[indeks].film_resim}")),
                            Text(
                              liste[indeks].film_ad.toString(),
                              style: TextStyle(
                                  fontSize: ekranyuk / 45,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(liste[indeks].film_yil.toString()),
                          ],
                        ),
                      ),
                    );
                  });
            } else {
              return Center();
            }
          },
        ));
  }
}
