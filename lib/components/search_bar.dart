import 'package:flutter/material.dart';
import 'package:advanced_search/advanced_search.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SearchBar extends StatefulWidget {
  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  List<String> searchableAsalList = [];
  List<String> searchableTujuanList = [];

  String selectedAsal = '';
  String selectedTujuan = '';

  @override
  void initState() {
    super.initState();
    fetchAsalList();
    fetchTujuanList();
  }

  Future<void> fetchAsalList() async {
    QuerySnapshot snapshot =
        await FirebaseFirestore.instance.collection('listbus').get();

    List<String> asalList = [];
    snapshot.docs.forEach((doc) {
      String asal = doc['asal'];
      if (!asalList.contains(asal)) {
        asalList.add(asal);
      }
    });

    setState(() {
      searchableAsalList = asalList;
    });
  }

  Future<void> fetchTujuanList() async {
    QuerySnapshot snapshot =
        await FirebaseFirestore.instance.collection('listbus').get();

    List<String> tujuanList = [];
    snapshot.docs.forEach((doc) {
      String tujuan = doc['tujuan'];
      if (!tujuanList.contains(tujuan)) {
        tujuanList.add(tujuan);
      }
    });

    setState(() {
      searchableTujuanList = tujuanList;
    });
  }

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
              searchItems: searchableAsalList,
              hintText: 'Asal Keberangkatan',
              hintTextColor: Colors.white,
              inputTextFieldBgColor: Colors.white10,
              selectedTextColor: Colors.blue,
              unSelectedTextColor: Colors.blue,
              focusedBorderColor: Colors.white,
              borderColor: Colors.white,
              cursorColor: Colors.white,
              onItemTap: (int index, String value) {
                setState(() {
                  selectedAsal = value;
                });
              },
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            leading: const Icon(Icons.location_on, color: Colors.white),
            title: AdvancedSearch(
              searchItems: searchableTujuanList,
              hintText: 'Tujuan',
              hintTextColor: Colors.white,
              inputTextFieldBgColor: Colors.white10,
              selectedTextColor: Colors.blue,
              unSelectedTextColor: Colors.blue,
              focusedBorderColor: Colors.white,
              borderColor: Colors.white,
              cursorColor: Colors.white,
              onItemTap: (int index, String value) {
                setState(() {
                  selectedTujuan = value;
                });
              },
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
///