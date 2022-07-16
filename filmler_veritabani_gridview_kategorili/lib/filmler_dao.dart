import 'package:filmler_veritabani_gridview_kategorili/veri_tabani_yardimcisi.dart';
import 'classlar.dart';

class FilmlerDAO {
  Future<List<Kategoriler>> kategorileriGoster() async {
    var db = await VeritabaniYardimcisi.veritabaniErisim();
    List<Map<String, dynamic>> maps =
        await db.rawQuery("SELECT * FROM kategoriler");
    return List.generate(maps.length, (index) {
      var satir = maps[index];
      var k = Kategoriler(satir["kategori_id"], satir["kategori_ad"]);
      return k;
    });
  }

  Future<List<Filmler>> belirliKategoridenGetir(int kategori_id) async {
    var db = await VeritabaniYardimcisi.veritabaniErisim();
    List<Map<String, dynamic>> maps = await db.rawQuery(
        "SELECT * FROM filmler,kategoriler,yonetmenler "
        "WHERE filmler.kategori_id='$kategori_id' AND filmler.kategori_id=kategoriler.kategori_id AND filmler.yonetmen_id=yonetmenler.yonetmen_id");
    return List.generate(maps.length, (index) {
      var satir = maps[index];
      var k = Kategoriler(satir["kategori_id"], satir["kategori_ad"]);
      var y = Yonetmenler(satir["yonetmen_id"], satir["yonetmen_ad"]);
      var f = Filmler(satir["film_id"], satir["film_ad"], satir["film_yil"],
          satir["film_resim"], k, y);
      return f;
    });
  }
}
