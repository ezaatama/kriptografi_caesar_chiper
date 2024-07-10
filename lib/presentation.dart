import 'package:flutter/material.dart';
import 'package:kripto_caesar_chipper/logic.dart';

class PresentationWidget extends StatefulWidget {
  const PresentationWidget({super.key});

  @override
  State<PresentationWidget> createState() => _PresentationWidgetState();
}

class _PresentationWidgetState extends State<PresentationWidget> {
  final TextEditingController _textController = TextEditingController();
  final TextEditingController _shiftController = TextEditingController();
  String _encryptedText = '';
  String _decryptedText = '';
  KriptoCaesarCipher? _cipher;

  void _encrypt() {
    final text = _textController.text;
    final shift = int.tryParse(_shiftController.text) ?? 0;
    _cipher = KriptoCaesarCipher(shift);
    setState(() {
      _encryptedText = _cipher!.encrypt(text);
    });
  }

  void _decrypt() {
    if (_cipher != null) {
      final text = _textController.text;
      final shift = int.tryParse(_shiftController.text) ?? 0;
      _cipher = KriptoCaesarCipher(shift);
      setState(() {
        _decryptedText = _cipher!.decrypt(text);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kriptografi Caesar Cipher'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _textController,
              decoration: InputDecoration(labelText: 'Text'),
            ),
            TextField(
              controller: _shiftController,
              decoration: InputDecoration(labelText: 'Pergeseran'),
              keyboardType: TextInputType.number,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: _encrypt,
                  child: Text('Encrypt'),
                ),
                ElevatedButton(
                  onPressed: _decrypt,
                  child: Text('Decrypt'),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text('Encrypted Text: $_encryptedText'),
            Text('Decrypted Text: $_decryptedText'),
          ],
        ),
      ),
    );
  }
}
