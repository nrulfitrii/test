import 'dart:io';

class Menu {
  String name;
  int price;
  Menu(this.name, this.price);
}

class Order {
  Menu menu;
  int quantity;
  Order(this.menu, this.quantity);
}

void main() {
  List<Menu> menus = [
    Menu('Nasi Goreng', 15000),
    Menu('Mie Goreng', 12000),
    Menu('Ayam Goreng', 18000),
    Menu('Sate Ayam', 20000),
    Menu('Soto Ayam', 15000),
  ];

  List<Order> orders = [];

  bool isOrdering = true;

  while (isOrdering) {
    printMenuList(menus);
    int selectedMenuIndex = getMenuChoice(menus.length);
    int quantity = getQuantity();

    Order order = Order(menus[selectedMenuIndex], quantity);
    orders.add(order);

    print('Pesanan ditambahkan.');

    isOrdering = getContinueOrdering();
  }

  print('Pesanan selesai.');

  printOrderSummary(orders);
}

void printMenuList(List<Menu> menu) {
  print('Daftar Menu:');
  for (int i = 0; i < menu.length; i++) {
    print('${i + 1}. ${menu[i].name} - Rp ${menu[i].price}');
  }
}

int getMenuChoice(int menuCount) {
  int selectedMenuIndex;
  bool isValidChoice = false;

  while (!isValidChoice) {
    stdout.write('Pilih menu [1-$menuCount]: ');
    String input = stdin.readLineSync();

    selectedMenuIndex = int.tryParse(input ?? '');

    if (selectedMenuIndex != null &&
        selectedMenuIndex >= 1 &&
        selectedMenuIndex <= menuCount) {
      isValidChoice = true;
    } else {
      print('Pilihan tidak valid. Silakan pilih nomor menu yang benar.');
    }
  }

  return selectedMenuIndex - 1;
}

int getQuantity() {
  int quantity;
  bool isValidQuantity = false;

  while (!isValidQuantity) {
    stdout.write('Jumlah pesanan: ');
    String input = stdin.readLineSync();

    quantity = int.tryParse(input ?? '');

    if (quantity != null && quantity > 0) {
      isValidQuantity = true;
    } else {
      print('Jumlah pesanan tidak valid. Silakan masukkan angka yang benar.');
    }
  }

  return quantity;
}

bool getContinueOrdering() {
  stdout.write('Tambah pesanan lain? (y/n): ');
  String input = stdin.readLineSync();

  return input?.toLowerCase() == 'y';
}

void printOrderSummary(List<Order> orders) {
  print('Ringkasan Pesanan:');
  for (int i = 0; i < orders.length; i++) {
    Order order = orders[i];
    int totalPrice = order.menu.price * order.quantity;
    print(
        '${i + 1}. ${order.menu.name} - ${order.quantity} x Rp ${order.menu.price} = Rp $totalPrice');
  }
}