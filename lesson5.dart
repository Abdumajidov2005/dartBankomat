import 'dart:io';

void main(List<String> args) {
  Map<String, String> userData = {};
  Map helpCounter = {
    "*100#": "hisobni ko'rish",
    "cash": "carta hisobini ko'rish",
    "help": "yordam olish",
    "*800#": "cartalarni ko'rish",
    "user": "ma'lumotlarni ko'rish",
  };

  Map cash = {"balans": "1000 so'm"};

  Map object = {
    "balans": "1000 mb",
    "smslar": "400ta",
    "daqiqa": "400min",
    "tungi": "10000mb",
  };

  while (true) {
    print("Parolni kiriting (4-8 belgidan iborat):");
    String? password = stdin.readLineSync();

    if (password != null && password.length >= 4 && password.length <= 8) {
      print("Muvofaqqiyatli ro'yxatdan o'tdiz");
      userData["password"] = password;
      print("Ma'lumotlaringiz userData: $userData");
      break;
    } else if (password != null && password.length > 8) {
      print("parol uzunligini oshirib yuborish mumkin emas");
    } else {
      print("uzunligi yetarli emas");
    }
  }

  while (true) {
    print("Telefon raqamni kiriting: (+998911712611) bo'lishi shart");
    String? call = stdin.readLineSync();

    if (call != null && call.contains("+998") && call.length == 13) {
      print("Telefon raqam qabul qilindi");
      userData["Telefon raqam"] = call;
      print(userData);
      break;
    } else {
      print("Qayta urinib ko'ring");
    }
  }

  while (true) {
    print(
      "Karta kiriting: (16 ta sondan iborat bo'lishi shart 1234567890123456)",
    );
    String? paymi = stdin.readLineSync();

    if (paymi != null && paymi.length == 16) {
      print("karta raqam to'g'ri $paymi");
      userData["Cartalar"] = paymi;
      print(userData);
      print("\nBizning xizmatlar:");
      helpCounter.forEach((key, value) {
        print("$key : $value");
      });
      break;
    } else {
      print("qayta kiriting");
    }
  }

  while (true) {
    print("\nAmallarni bajarish uchun kodni kiriting ('x' chiqish uchun):");
    String? kod = stdin.readLineSync();

    if (kod == "x") {
      print("Amaliyot yakunlandi");
      break; // tsiklni tugatish
    }

    // switch bilan amallarni bajarish
    switch (kod) {
      case "*100#":
        print("\nSizning balansingiz:");
        object.forEach((key, value) {
          print("$key : $value");
        });
        break;
      case "help":
        print("\nBizning xizmatlar:");
        helpCounter.forEach((key, value) {
          print("$key : $value");
        });
        break;
      case "cash":
        print("\nKartangizdagi balans:");
        cash.forEach((key, value) {
          print("$key : $value");
        });
        break;
      case "*800#":
        print("\nSizning kartalaringiz:");
        print(userData["Cartalar"]);
        break;
      case "user":
        print("\nSizning ma'lumotlaringiz:");
        // print(userData);
        userData.forEach((key, value) {
          print("$key : $value");
        });
        break;
      default:
        print("Noto‘g‘ri kod. Qayta urinib ko‘ring.");
    }
  }
}
