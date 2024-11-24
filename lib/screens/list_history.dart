import 'package:flutter/material.dart';

class ListHistory extends StatefulWidget {
  const ListHistory({super.key});

  @override
  State<ListHistory> createState() => _ListHistoryState();
}

class _ListHistoryState extends State<ListHistory> {
  List<String> items = ['Podomoro 1', 'Podomoro 2', 'Podomoro 3'];

  void _deleteItem(int index) {
    setState(() {
      items.removeAt(index);
    });
  }

  void _showDeleteDialog(BuildContext context, int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Konfirmasi Hapus'),
          content: Text('Apakah Anda yakin ingin menghapus "${items[index]}"?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('Batal'),
            ),
            TextButton(
              onPressed: () {
                _deleteItem(index);
                Navigator.of(context).pop();
              },
              child: Text('Hapus'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(items[index]),
          trailing: DropdownButton<String>(
            icon: Icon(Icons.more_vert),
            onChanged: (value) {
              if (value == 'delete') {
                _showDeleteDialog(context, index);
              }
            },
            items: [
              DropdownMenuItem(
                value: 'delete',
                child: Text('Hapus'),
              ),
            ],
          ),
        );
      },
    );
  }
}
