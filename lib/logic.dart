class KriptoCaesarCipher {
  final int shift;

  KriptoCaesarCipher(this.shift);

  //65 dan 97 adalah nilai kode ASCII
  //65 ('A') hingga 90 ('Z')
  //97 ('a') hingga 122 ('z')

  String encrypt(String text) {
    return String.fromCharCodes(
      text.codeUnits.map((unit) {
        if (unit >= 65 && unit <= 90) {
          // Uppercase letters
          return 65 + (unit - 65 + shift) % 26;
        } else if (unit >= 97 && unit <= 122) {
          // Lowercase letters
          return 97 + (unit - 97 + shift) % 26;
        } else {
          // Non-alphabetic characters
          return unit;
        }
      }),
    );
  }

  String decrypt(String text) {
    return String.fromCharCodes(
      text.codeUnits.map((unit) {
        if (unit >= 65 && unit <= 90) {
          // Uppercase letters
          return 65 + (unit - 65 - shift + 26) % 26;
        } else if (unit >= 97 && unit <= 122) {
          // Lowercase letters
          return 97 + (unit - 97 - shift + 26) % 26;
        } else {
          // Non-alphabetic characters
          return unit;
        }
      }),
    );
  }
}
