import 'package:flutter/material.dart';
import 'package:msib_suitmedia/src/third_screen.dart';
import 'package:msib_suitmedia/widget/appbar.dart';

class SecondScreen extends StatefulWidget {
  static String route = '/second_screen';

  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  String? selectedName;

  @override
  Widget build(BuildContext context) {
    final String nameFromFirstScreen =
        ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: appBar(context, "Second Screen"),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 13,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                ),
                Text(
                  '$nameFromFirstScreen',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
              ],
            ),
            Center(
              child: Text(
                selectedName ?? "No User Selected",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () async {
                  final selectedUserName = await Navigator.pushNamed(
                    context,
                    ThirdScreen.route,
                  ) as String?; // Cast the result to String?

                  if (selectedUserName != null) {
                    setState(() {
                      selectedName = selectedUserName;
                    });
                  }
                },
                child: Text(
                  "Choose a User",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
