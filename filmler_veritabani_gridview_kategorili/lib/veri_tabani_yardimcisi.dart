import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:io';
class VeritabaniYardimcisi{
  static final String veritabaniAdi="filmler.sqlite";


  static Future<Database> veritabaniErisim() async{
    String veritabaniYolu=join(await getDatabasesPath(),veritabaniAdi);
    if(await databaseExists(veritabaniYolu)){
      print("Veri Tabanı zaten var");

    }else{
      ByteData data= await rootBundle.load("veritabani/$veritabaniAdi");
      List<int> bytes=data.buffer.asUint8List(data.offsetInBytes,data.lengthInBytes);
      await File(veritabaniYolu).writeAsBytes(bytes,flush: true);
      print("Veri Tabanı kopyalandı");
    }
    return openDatabase(veritabaniYolu);
  }

}
