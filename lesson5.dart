import 'dart:io';

void main(List<String> args) {
  Map<String, dynamic> userData = {};
  Map<String, String> helpCounter = {
    "*100#": "hisobni ko'rish",
    "cash": "carta hisobini ko'rish",
    "help": "yordam olish",
    "*800#": "cartalarni ko'rish",
    "user": "ma'lumotlarni ko'rish",
    "transfer": "kartadan kartaga pul o'tkazish",
  };

  Map<String, int> cards = {};

  Map<String, dynamic> object = {
    "balans": "1000 mb",
    "smslar": "400ta",
    "daqiqa": "400min",
    "tungi": "10000mb",
  };

  // 1️⃣ Parol olish
  while (true) {
    stdout.write("Parolni kiriting (4-8 belgidan iborat): ");
    String? password = stdin.readLineSync();
    if (password != null && password.length >= 4 && password.length <= 8) {
      print("Muvofaqqiyatli ro'yxatdan o'tdingiz");
      userData["password"] = password;
      break;
    } else if (password != null && password.length > 8) {
      print("Parol uzunligini oshirib yuborish mumkin emas");
    } else {
      print("Parol uzunligi yetarli emas");
    }
  }

  // 2️⃣ Telefon raqam olish
  while (true) {
    stdout.write("Telefon raqamni kiriting (+998911712611 formatida): ");
    String? call = stdin.readLineSync();
    if (call != null && call.startsWith("+998") && call.length == 13) {
      print("Telefon raqam qabul qilindi");
      userData["Telefon raqam"] = call;
      break;
    } else {
      print("Qayta urinib ko'ring");
    }
  }

  // 3️⃣ Karta qo‘shish
  while (true) {
    stdout.write("Karta kiriting (16 raqamdan iborat): ");
    String? paymi = stdin.readLineSync();

    if (paymi != null && paymi.length == 16) {
      stdout.write("Kartangizdagi balansni kiriting: ");
      int? bal = int.tryParse(stdin.readLineSync()!);
      if (bal != null) {
        cards[paymi] = bal;
        userData["Cartalar"] ??= [];
        userData["Cartalar"].add(paymi);
        print("Karta qo'shildi: $paymi | Balans: $bal");
      } else {
        print("Balans noto'g'ri kiritildi");
      }

      stdout.write("Yana karta qo'shasizmi? (ha/yo'q): ");
      String? javob = stdin.readLineSync();
      if (javob != "ha") break;
    } else {
      print("Karta raqami noto'g'ri, qayta kiriting");
    }
  }

  // 4️⃣ Xizmatlar ro'yxati
  print("\nBizning xizmatlar:");
  helpCounter.forEach((key, value) => print("$key : $value"));

  // 5️⃣ Amal bajarish
  while (true) {
    stdout.write(
      "\nAmallarni bajarish uchun kodni kiriting ('x' chiqish uchun): ",
    );
    String? kod = stdin.readLineSync();

    if (kod == "x") {
      print("Amaliyot yakunlandi");
      break;
    }

    switch (kod) {
      case "*100#":
        print("\nSizning balansingiz:");
        object.forEach((key, value) => print("$key : $value"));
        break;

      case "help":
        print("\nBizning xizmatlar:");
        helpCounter.forEach((key, value) => print("$key : $value"));
        break;

      case "cash":
        print("\nKartalardagi balanslar:");
        cards.forEach((key, value) => print("$key : $value so'm"));
        break;

      case "*800#":
        print("\nSizning kartalaringiz:");
        print(userData["Cartalar"]);
        break;

      case "user":
        print("\nSizning ma'lumotlaringiz:");
        userData.forEach((key, value) => print("$key : $value"));
        break;

      case "transfer":
        stdout.write("Pul o'tkazmoqchi bo'lgan kartani kiriting: ");
        String from = stdin.readLineSync()!;
        stdout.write("Qabul qiluvchi kartani kiriting: ");
        String to = stdin.readLineSync()!;
        stdout.write("Summani kiriting: ");
        int? amount = int.tryParse(stdin.readLineSync()!);

        if (amount == null) {
          print("Noto'g'ri summa kiritildi");
          break;
        }

        if (cards.containsKey(from) && cards.containsKey(to)) {
          if (cards[from]! >= amount) {
            cards[from] = cards[from]! - amount;
            cards[to] = cards[to]! + amount;
            print("Pul muvaffaqiyatli o'tkazildi!");
            print("Yangi balanslar:");
            print("$from : ${cards[from]} so'm");
            print("$to : ${cards[to]} so'm");
          } else {
            print("Balans yetarli emas");
          }
        } else {
          print("Karta topilmadi");
        }
        break;

      default:
        print("Noto'g'ri kod. Qayta urinib ko'ring.");
    }
  }
}
