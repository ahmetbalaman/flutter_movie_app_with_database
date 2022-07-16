class Filmler {
  int? film_id;
  String? film_ad;
  int? film_yil;
  String? film_resim;

  Kategoriler? kategori;

  Yonetmenler? yonetmen;

  Filmler(this.film_id, this.film_ad, this.film_yil, this.film_resim,
      this.kategori, this.yonetmen);
}

class Kategoriler {
  int? kategori_id;
  String? kategori_ad;

  Kategoriler(this.kategori_id, this.kategori_ad);
}

class Yonetmenler {
  int? yonetmen_id;
  String? yonetmen_ad;

  Yonetmenler(this.yonetmen_id, this.yonetmen_ad);
}
