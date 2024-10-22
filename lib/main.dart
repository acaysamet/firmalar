import 'package:flutter/material.dart';

void main() {
  runApp(MyApp()); // Uygulamayı başlatan ana fonksiyon
}

class MyApp extends StatelessWidget {
  // MyApp sınıfı uygulamanın ana widget'ını tanımlar
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Debug yazısını gizler
      home: Scaffold(
        // Uygulamanın temel yapısını oluşturan Scaffold widget'ı
        appBar: AppBar(
          backgroundColor: Colors.blue, // AppBar'ın arka plan rengini ayarlar
          title: Row(
            // AppBar'da başlık ve ikonların hizalanması için Row widget'ı
            mainAxisAlignment: MainAxisAlignment
                .spaceBetween, // İkonlar ve başlık arasında boşluk bırakır
            children: [
              IconButton(
                icon:
                    Icon(Icons.arrow_back, color: Colors.white), // Geri butonu
                onPressed: () {}, // Butona basıldığında gerçekleşecek işlem
              ),
              Expanded(
                child: Center(
                  child: Text(
                    'Firmalar', // AppBar'daki başlık metni
                    style:
                        TextStyle(color: Colors.white), // Başlık metninin stili
                  ),
                ),
              ),
              Opacity(
                opacity: 0.0, // İkinci geri butonunu görünmez yapar
                child: IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {}, // Butona basıldığında gerçekleşecek işlem
                ),
              ),
            ],
          ),
        ),
        body: FirmalarScreen(), // Ana içeriği gösteren widget
      ),
    );
  }
}

class FirmalarScreen extends StatelessWidget {
  // Firmalar ekranını tanımlayan widget
  final List<Map<String, String>> firmalar = [
    // Firma verilerinin listesi
    {'firmaAdi': 'Firma Adı Uzun Firma Adı', 'indirim': '%10'},
    {'firmaAdi': 'Firma Adı', 'indirim': '%10'},
    {'firmaAdi': 'Firma Adı Uzun Firma Adı', 'indirim': '%10'},
    {'firmaAdi': 'Firma Adı', 'indirim': '%10'},
    {'firmaAdi': 'Firma Adı Uzun Firma Adı', 'indirim': '%10'},
  ];

  @override
  Widget build(BuildContext context) {
    final screenHeight =
        MediaQuery.of(context).size.height; // Ekran yüksekliğini alır
    final appBarHeight = kToolbarHeight; // AppBar'ın yüksekliğini alır
    final remainingHeight =
        screenHeight - appBarHeight - 200; // Geriye kalan yükseklik

    return Column(
      // Dikey düzen oluşturmak için Column widget'ı
      children: [
        Padding(
          padding: EdgeInsets.all(16.0), // Dışarıdan 16 birim boşluk ekler
          child: Center(
            child: Container(
              width: double.infinity, // Genişliğini tam ekran yapar
              padding:
                  EdgeInsets.symmetric(vertical: 12.0), // Dikey boşluk ekler
              decoration: BoxDecoration(
                color: Colors.indigo[700], // Arka plan rengini ayarlar
                borderRadius: BorderRadius.circular(20.0), // Köşeleri yuvarlar
              ),
              child: Row(
                // İçerikleri yatay olarak hizalamak için Row widget'ı
                children: [
                  SizedBox(width: 10.0), // 10 birim boşluk
                  Icon(Icons.local_hospital,
                      color: Colors.white), // Sağlık simgesi
                  SizedBox(width: 8.0), // 8 birim boşluk
                  Expanded(
                    child: Text(
                      'Sağlık', // Başlık metni
                      style: TextStyle(
                        color: Colors.white, // Metin rengi
                        fontSize: 20.0, // Metin boyutu
                        fontWeight: FontWeight.bold, // Metin kalınlığı
                      ),
                      textAlign: TextAlign.center, // Metni ortalar
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding:
              const EdgeInsets.all(16.0), // Dışarıdan 16 birim boşluk ekler
          child: TextField(
            // Arama çubuğu
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.search), // Arama simgesi
              hintText: 'Firma Ara',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0), // Kenarları yuvarlar
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: 16.0), // Yatay yönde 16 birim boşluk ekler
          child: Text('İstediğiniz firmada indirim yakalama fırsatı...'),
        ),
        Expanded(
          child: ListView.builder(
            // Liste oluşturmak için ListView kullanır
            itemCount: firmalar.length, // Liste eleman sayısını ayarlar
            itemBuilder: (context, index) {
              // Her bir eleman için oluşturulan widget
              return SizedBox(
                height: remainingHeight /
                    firmalar.length, // Her bir firmanın yüksekliğini ayarlar
                child: FirmaCard(
                  // Firma kartını oluşturur
                  firmaAdi: firmalar[index]['firmaAdi']!,
                  indirim: '%10', // İndirim oranı
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class FirmaCard extends StatelessWidget {
  // Firma kartını tanımlayan widget
  final String firmaAdi; // Firma adı
  final String indirim; // İndirim oranı

  FirmaCard({required this.firmaAdi, required this.indirim}); // Constructor

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(
          vertical: 8.0, horizontal: 16.0), // Kartın dış boşlukları
      child: ListTile(
        // Liste öğesi
        leading: Icon(Icons.business, size: 40), // İşletme simgesi
        title: Text(
          firmaAdi, // Firma adı
          style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold), // Başlık metni stili
        ),
        trailing: Container(
          padding: EdgeInsets.symmetric(
              vertical: 12.0, horizontal: 24.0), // Dikey ve yatay boşluk
          decoration: BoxDecoration(
            color: Colors.indigo[700], // Arka plan rengini ayarlar
            borderRadius: BorderRadius.only(
              // Sadece belirli köşeleri yuvarlar
              topLeft: Radius.circular(0),
              bottomLeft: Radius.circular(0),
              topRight: Radius.circular(8.0),
              bottomRight: Radius.circular(8.0),
            ),
          ),
          child: Text(
            indirim, // İndirim oranı
            style: TextStyle(
              color: Colors.white, // Metin rengi
              fontSize: 18.0, // Metin boyutu
              fontWeight: FontWeight.bold, // Metin kalınlığı
            ),
          ),
        ),
        onTap: () {}, // Kart tıklandığında gerçekleşecek işlem
      ),
    );
  }
}
