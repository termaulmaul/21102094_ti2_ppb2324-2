void main() {
//   var angka = 5;
//   var grade = "B";

//   print("Hello, World!"); //

//   var name = 'Puspita';
//   var year = 2023;
//   var bulan = ['Januari', 'Februari', 'Maret', 'April'];
//   var image = {
//     'buah': ['mangga'],
//     'url': '//path/to/mangga.jpg'
//   };

//   if (angka > 0) {
//     print('bilangan positif');
//   } else if (angka < 0) {
//     print('bilangan negatif');
//   }

//   switch (grade) {
//     case "A":
//       print("GGWP");
//       break;
//     case "B":
//       print("GG");
//       break;
//   }

//   for (int i = 1; i <= 100; i++) {
//     print(i);
//   }

//   List<String> month = ['Januari', 'Februari', 'Maret', 'April'];

//   var angkaSet = {1, 4, 6, 4, 1};
//   Set<int> bilanganSet = new Set.from(angkaSet);
//   print(bilanganSet);

  var kucing = Hewan("Maman", 2, 5.3);
  kucing.makan();
  kucing.tidur();

  var kucing2 = Meong("Cimol", 2, 5.0, "Oren");
  kucing2.jalan();
}

class Hewan {
  String nama;
  int umur;
  double berat;

  Hewan(this.nama, this.umur, this.berat);

  void makan() {
    print('$nama makan.');
    berat = berat + 0.2;
  }

  void tidur() {
    print('$nama sedang tidur');
  }
}

class Meong extends Hewan {
  String warnaBulu;

  Meong(
    String nama,
    int umur,
    double berat,
    this.warnaBulu,
  ) : super(nama, umur, berat);

  void jalan() {
    print('$nama berjalan');
  }

  void warna() {
    print('$nama berwarna $warnaBulu');
  }
}
