import 'dart:io';

void main(List<String> args) {
  Map<String, String> userData = {};
  Map helpCounter = {
    "*100#": "hisobni ko'rish",
    "1": "cartalarni ko'rish",
    "help": "yordam olish",
  };

  Map cash = {"balans": "1000 so'm"};

  Map object = {
    "balans": "1000 mb",
    "smslar": "400ta",
    "daqiqa": "400min",
    "tungi": "10000mb",
  };

  print("Parolni kiriting:");
  String? password = stdin.readLineSync();

  if (password != null && password.length >= 4 && password.length <= 8) {
    print("Muvofaqqiyatli ro'yxatdan o'tdiz");
    userData["password"] = password;
    print("Ma'lumotlaringiz userData: $userData");
    print("Bizning ximatlar $helpCounter");
  } else if (password != null && password.length > 8) {
    print("parol uzunligini oshirib yuborish mumkin emas");
  } else {
    print("uzunligi yetarli emas");
  }

  print("Karta kiriting:");
  String? paymi = stdin.readLineSync();

  if (paymi != null && paymi.length == 16) {
    print("karta raqam to'g'ri $paymi");
    userData["Cartalar"] = paymi;
    print(userData);
  } else {
    print("qayta kiriting");
  }
  

  print("Kodni kiriting:");
  String? kod = stdin.readLineSync();

  switch (kod) {
    case "*100#":
      print(object);
      break;
    case "help":
      print(helpCounter);
      break;
    case "card":
      print(cash);
      break;
  }
}
