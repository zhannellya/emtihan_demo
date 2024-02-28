import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/library_page.dart';
import 'package:untitled/library_provider.dart';
import 'package:untitled/record_page.dart';
import 'package:untitled/tickets_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => LibraryProvider(), // Providing FormDataProvider
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        // initialRoute: '/',
        // routes: {
        //   '/events_page': (context) => EventDetailsPage(),
        // },
        home: DefaultTabController(
          length: 2,
          child: Scaffold(
            appBar: TabBar(
              tabs: <Widget>[
                Tab(text: 'Events'),
                Tab(text: 'Tickets'),
                Tab(text: 'Records'),
              ],
            ),
            body: TabBarView(
              children: <Widget>[
                LibraryPage(),
                TicketsPage(),
                RecordPage(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
