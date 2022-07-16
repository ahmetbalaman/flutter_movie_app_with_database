import 'package:filmler_veritabani_gridview_kategorili/classlar.dart';
import 'package:flutter/material.dart';

class SecilenFilm extends StatelessWidget {
  Filmler? film;

  SecilenFilm({required this.film});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Seçilen Film: ${film?.film_ad}"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(child: Image.asset("assets/${film?.film_resim}")),
            Text(
              "Filmin adı: ${film?.film_ad}",
              style: stil,
            ),
            Text(
              "Kategorisi: ${film?.kategori?.kategori_ad}",
              style: stil,
            ),
            Text(
              "Film Yöetmeni: ${film?.yonetmen?.yonetmen_ad}",
              style: stil,
            ),
            Text(
              "Film çıkış yılı: ${film?.film_yil}",
              style: stil,
            ),
          ],
        ),
      ),
    );
  }
}

TextStyle get stil => const TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 20,
      color: Colors.red,
    );
