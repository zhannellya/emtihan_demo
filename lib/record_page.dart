import 'package:flutter/material.dart';

class RecordPage extends StatelessWidget {
  const RecordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: _buildBody(context),
      ),
    );
  }
}

Widget _buildBody(BuildContext contex) {
  return Column(
    children: [
      SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              textbuild(),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    ],
  );
}

Widget textbuild() {
  return const Center(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: Text(
            'Records',
            style: TextStyle(
              fontSize: 15,
            ),
          ),
        ),
      ],
    ),
  );
}
