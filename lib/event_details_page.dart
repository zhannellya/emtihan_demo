import 'package:flutter/material.dart';

class EventdetailsPage extends StatelessWidget {
  const EventdetailsPage({Key? key}) : super(key: key);

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
  return SingleChildScrollView(
    child: Column(
      children: [
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                textBuild(),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}

Widget textBuild() {
  return const Center(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            Text(
              'Tickets List',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Column(
              children: [
                Text(
                  'WorldSkills Competition 2022 Special Edition',
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
                Text(
                  'This year, 61 international skill competitions will take place across Europe, North America',
                  style: TextStyle(
                    fontSize: 11,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ],
    ),
  );
}
