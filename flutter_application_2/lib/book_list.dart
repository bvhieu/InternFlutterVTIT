import 'package:flutter/material.dart';
import 'book_dummy_data.dart';

class BookList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: listDummyBook.length,
      itemBuilder: (context, index) {
        final book = listDummyBook[index];
        return ListTile(
          title: Text(book.title),
          subtitle: Text('by ${book.author}'),
          trailing: Text('${book.year}'),
        );
      },
    );
  }
}
