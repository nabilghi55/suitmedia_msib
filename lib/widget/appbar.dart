import 'package:flutter/material.dart';

AppBar  appBar(BuildContext context, String title) {
  return AppBar(
      elevation: 0,
          surfaceTintColor: Colors.transparent,
          title: Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center,
          ),
          bottom: const PreferredSize(
            preferredSize: Size.fromHeight(1),
            child: Divider(
              color: Colors.grey,
              thickness: 1,
            ),
          ),
          centerTitle: true,
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            style: ButtonStyle(
              padding: MaterialStateProperty.all(
                const EdgeInsets.all(0),
              ),
            ),
            icon: const Icon(
              Icons.chevron_left,
              color: Color(0xFF554AF0),
              size: 34,
            ),
          ),
  
  );
}