import 'package:flutter/material.dart';
import 'package:msib_suitmedia/widget/input.dart'; // Pastikan impor file sudah sesuai dengan struktur folder Anda

class FirstScreen extends StatefulWidget {
  static const String route = '/';

  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController sentenceController = TextEditingController();
  bool isPalindrome = false;

  void checkPalindrome() {
    String input = sentenceController.text.toLowerCase().replaceAll(" ", "");
    String reversed = input.split('').reversed.join('');

    setState(() {
      isPalindrome = input == reversed;
    });

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Column(
            children: <Widget>[
              Icon(
                isPalindrome ? Icons.check : Icons.close,
                color: isPalindrome ? Colors.green : Colors.red,
                size: 50,
              ),
              SizedBox(width: 10),
              Text(isPalindrome ? 'Is Palindrome' : 'NOT PALINDROME'),
            ],
          ),
          content: Text(isPalindrome
              ? 'The sentence is a palindrome.'
              : 'The sentence is not a palindrome.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Close'),
              
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/background.png'),
                    fit: BoxFit.cover)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(32),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(90),
                      color: Colors.white.withOpacity(0.5)),
                  child: const Icon(
                    size: 50,
                    Icons.person_add_alt_1,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                InputFields(
                  nameController: nameController,
                  sentenceController: sentenceController,
                  checkPalindrome: checkPalindrome,
                ),
              ],
            )));
  }
}
