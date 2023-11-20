import 'dart:io';

class Makanan {
  String makanan;
  int harga;
  int _uang;
  int total;
  Makanan(this.makanan, this.harga);

  void bayar() {
    if (_uang < total) {
      print(
          "Uang Tidak Cukup untuk membeli makanan uang kurang ${total - _uang}");
    } else if (_uang == total) {
      print("Uang Pas ");
    } else if (_uang > total) {
      print("Ada Kembalian sebesar ${_uang - total}");
    }
  }

  void tampilkaninfo() {
    print("Makanan : $makanan");
    print("Harga : $harga");
  }

  get uang {
    return _uang;
  }

  set uang(int uang) {
    if (uang <= 0) {
      _uang = 0;
    } else if (uang >= 1) {
      _uang = uang;
    }
  }
}

void main(List<String> args) {
  Makanan mie = Makanan("Mie Goreng", 5000);
  Makanan nasi = Makanan("Nasi Goreng", 7000);
  Makanan bakso = Makanan("Bakso", 7000);
  Makanan mieAyam = Makanan("Mie Ayam", 7000);

  print("============Menu=============");
  print("1. Mie Goreng");
  print("2. Nasi");
  print("3. Bakso");
  print("4. Mie Ayam");

  int pilih = int.parse(stdin.readLineSync());
  if (pilih == 1) {
    mie.tampilkaninfo();
    print("Ingin Beli Berapa ?");
    int jumlah = int.parse(stdin.readLineSync());
    mie.total = mie.harga * jumlah;
    print("Total Yang Harus Dibayar : ${mie.total}");
    print("Masukan Jumlah Uang :");
    int uangpembayaran = int.parse(stdin.readLineSync());
    mie.uang = uangpembayaran;
    mie.bayar();
  } else if (pilih == 2) {
    nasi.tampilkaninfo();
    print("Ingin Beli Berapa ?");
    int jumlah = int.parse(stdin.readLineSync());
    nasi.total = nasi.harga * jumlah;
    print("Total Yang Harus Dibayar : ${nasi.total}");
    print("Masukan Jumlah Uang :");
    int uangpembayaran = int.parse(stdin.readLineSync());
    nasi.uang = uangpembayaran;
    nasi.bayar();
  } else if (pilih == 3) {
    print("Silahkan Bayar : ");
    bakso.tampilkaninfo();
    print("Ingin Beli Berapa ?");
    int jumlah = int.parse(stdin.readLineSync());
    bakso.total = bakso.harga * jumlah;
    print("Total Yang Harus Dibayar : ${bakso.total}");
    print("Masukan Jumlah Uang :");
    int uangpembayaran = int.parse(stdin.readLineSync());
    bakso.uang = uangpembayaran;
    bakso.bayar();
  } else if (pilih == 4) {
    mieAyam.tampilkaninfo();
    print("Ingin Beli Berapa ?");
    int jumlah = int.parse(stdin.readLineSync());
    mieAyam.total = mieAyam.harga * jumlah;
    print("Total Yang Harus Dibayar : ${mieAyam.total}");
    print("Masukan Jumlah Uang :");
    int uangpembayaran = int.parse(stdin.readLineSync());
    mieAyam.uang = uangpembayaran;
    mieAyam.bayar();
  }
}