import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/library_provider.dart';

class LibraryPage extends StatelessWidget {
  const LibraryPage({Key? key});

  @override
  Widget build(BuildContext context) {
    final libProvider = Provider.of<LibraryProvider>(context, listen: false);
    libProvider.init();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Wrap(
                children: [
                  TextField(
                    onChanged: (value) => libProvider.runSearch(value),
                    decoration: const InputDecoration(
                        labelText: 'Search', suffixIcon: Icon(Icons.search)),
                  ),
                  ChoiceChip(
                    label: Text("filter"),
                    selected: false,
                    onSelected: (value) {
                      showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return Wrap(
                              children: [
                                InkWell(
                                  child: const ListTile(
                                    leading: Icon(Icons.share),
                                    title: Text('All'),
                                  ),
                                  onTap: () {
                                    libProvider.runFilter('');
                                    Navigator.pop(context);
                                  },
                                ),
                                InkWell(
                                  child: const ListTile(
                                    leading: Icon(Icons.share),
                                    title: Text('Readd'),
                                  ),
                                  onTap: () {
                                    libProvider.runFilter('Readd');
                                    Navigator.pop(context);
                                  },
                                ),
                                InkWell(
                                  child: const ListTile(
                                    leading: Icon(Icons.share),
                                    title: Text('Unread'),
                                  ),
                                  onTap: () {
                                    libProvider.runFilter('Unread');
                                    Navigator.pop(context);
                                  },
                                ),
                              ],
                            );
                          });
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Consumer<LibraryProvider>(builder: (context, data, child) {
              return Expanded(
                child: data.books.isNotEmpty
                    ? BookList(bookList: data.books)
                    : const Text(
                        'No results found',
                        style: TextStyle(fontSize: 21),
                      ),
              );
            }),
          ],
        ),
      ),
    );
  }
}

class BookList extends StatelessWidget {
  final List<Book> bookList;
  const BookList({Key? key, required this.bookList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: bookList.length,
      itemBuilder: (context, index) => Card(
        elevation: 3,
        child: Padding(
          padding: EdgeInsets.all(10),
          child: ListTile(
            title: Text(
              bookList[index].title,
              maxLines: 2,
              style: const TextStyle(
                fontSize: 14,
              ),
            ),
            trailing: Text(
              bookList[index].title,
              style: const TextStyle(
                fontSize: 10,
              ),
            ),
            onTap: () {
              Navigator.pushNamed(context, '/events_page',
                  arguments: bookList[index].title);
            },
            // leading: Image.asset(images.events_00_A.jpg),
            // trailing: const Text("Read"),
          ),
        ),
      ),
    );
  }
}
