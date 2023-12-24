import 'package:flutter/material.dart';
import 'package:msib_suitmedia/src/second_screen.dart';

class InputFields extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController sentenceController;
  final Function checkPalindrome;

  const InputFields({
    Key? key,
    required this.nameController,
    required this.sentenceController,
    required this.checkPalindrome,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 33),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          TextField(
              controller: nameController,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: "Name",
                hintStyle: TextStyle(
                  color: Color(0xFF6867775C),
                ),
                contentPadding: const EdgeInsets.only(right: 20, left: 16),
                border: const OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.all(
                    Radius.circular(12),
                  ),
                ),
              )),
          SizedBox(height: 20),
          TextField(
              controller: sentenceController,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: "Palindrome",
                hintStyle: TextStyle(
                  color: Color(0xFF6867775C),
                ),
                contentPadding: const EdgeInsets.only(right: 20, left: 16),
                border: const OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.all(
                    Radius.circular(12),
                  ),
                ),
              )),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              if (nameController.text.isEmpty ||
                  sentenceController.text.isEmpty) {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Validation Error'),
                      content: Text('Please fill in all fields.'),
                      actions: <Widget>[
                        TextButton(
                          child: Text('OK'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
              } else {
                checkPalindrome();
              }
            },
            child: Text(
              'CHECK',
              style: TextStyle(color: Colors.white),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
            onPressed: () {
              if (nameController.text.isEmpty ||
                  sentenceController.text.isEmpty) {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Validation Error'),
                      content: Text('Please fill in all fields.'),
                      actions: <Widget>[
                        TextButton(
                          child: Text('OK'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
              } else {
                Navigator.pushNamed(
                  context,
                  SecondScreen.route,
                  arguments: nameController.text,
                );
              }
            },
            child: Text(
              'NEXT',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
