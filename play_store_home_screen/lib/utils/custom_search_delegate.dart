import 'package:flutter/material.dart';

import 'list_item_data.dart';

class CustomSearchDelegate extends SearchDelegate {
  List<List<ListItemData>> item_list;

  CustomSearchDelegate({required this.item_list});

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];
    int item;
    for (item = 0; item < item_list[0].length; item++) {
      if (item_list[0][item].name.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(item_list[0][item].name);
      }
    }

    return ListView.builder(
        itemCount: matchQuery.length,
        itemBuilder: (context, index) {
          var result = matchQuery[index];
          return ListTile(
            leading: Text(result),
          );
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    int item;
    for (item = 0; item < item_list[0].length; item++) {
      if (item_list[0][item].name.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(item_list[0][item].name);
      }
    }
    return ListView.builder(
        itemCount: matchQuery.length,
        itemBuilder: (context, index) {
          var result = matchQuery[index];
          return ListTile(
            leading: Text(result),
          );
        });
  }
}
