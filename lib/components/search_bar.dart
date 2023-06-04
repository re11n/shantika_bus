import 'package:advanced_search/advanced_search.dart';
import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  final List<String> searchableList = ["Bandung", "Jakarta", "Bogor"];

  SearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            leading: const Icon(Icons.departure_board, color: Colors.white),
            title: AdvancedSearch(
              searchItems: searchableList,
              // other properties...
              hintText: 'Asal Keberangkatan?',
              hintTextColor: Colors.white,
              inputTextFieldBgColor: Colors.white10,
              selectedTextColor: Colors.blue,
              unSelectedTextColor: Colors.blue,
              focusedBorderColor: Colors.white,
              borderColor: Colors.white,
              cursorColor: Colors.white,
              onItemTap: (int index, String value) {},
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            leading: const Icon(Icons.location_on, color: Colors.white),
            title: AdvancedSearch(
              searchItems: searchableList,
              // other properties...
              hintText: 'Tujuan?',
              hintTextColor: Colors.white,
              inputTextFieldBgColor: Colors.white10,
              selectedTextColor: Colors.blue,
              unSelectedTextColor: Colors.blue,
              focusedBorderColor: Colors.white,
              borderColor: Colors.white,
              cursorColor: Colors.white,
              onItemTap: (int index, String value) {},
            ),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            // Put the function to handle search here.
          },
          child: const Text("Cari"),
        ),
      ],
    );
  }

  Widget searchWidget(String text) {
    return ListTile(
      title: Text(
        text.length > 3 ? text.substring(0, 3) : text,
        style: const TextStyle(
            fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white),
      ),
      subtitle: Text(
        text,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(
          fontWeight: FontWeight.normal,
          fontSize: 12,
          color: Colors.black26,
        ),
      ),
    );
  }
}
