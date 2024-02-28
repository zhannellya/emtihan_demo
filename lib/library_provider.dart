import 'package:flutter/material.dart';
import 'package:untitled/book_list.dart';

class LibraryProvider extends ChangeNotifier {
  List<Book> foundBooks = [];
  void init() {
    foundBooks = bookList;
    print('init');
  }

  List<Book> get books => foundBooks;
  String _searchString = "";

  // UnmodifiableListView<Book> get books => _searchString.isEmpty
  //     ? UnmodifiableListView(_bookList)
  //     : UnmodifiableListView(_bookList.where((book) =>
  //         book.category.toLowerCase().contains(_searchString.toLowerCase()) ||
  //         book.category.toLowerCase().contains(_searchString.toLowerCase())));

  void changeSearchAndFilterString2(String searchString) {
    _searchString = searchString;
    notifyListeners();
  }

  void runFilter(String category) {
    List<Book> results = [];
    if (category.isEmpty) {
      results = bookList;
    } else {
      results = bookList
          .where((book) =>
              book.category.toLowerCase().contains(category.toLowerCase()))
          .toList();
    }

    foundBooks = results;
    notifyListeners();
  }

  void runSearch(String enteredKeyword) {
    List<Book> results = [];
    if (enteredKeyword.isEmpty) {
      results = bookList;
    } else {
      results = bookList
          .where((book) =>
              book.title.toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
    }

    foundBooks = results;
    notifyListeners();
  }
}

class Book {
  final String title;
  final String author;
  final String category;
  final String uri;

  Book({
    required this.title,
    required this.author,
    required this.category,
    required this.uri,
  });
}
