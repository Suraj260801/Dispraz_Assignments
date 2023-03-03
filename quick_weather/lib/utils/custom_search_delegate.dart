import 'package:flutter/material.dart';

class CustomSearchDelegate extends SearchDelegate {
  final List<dynamic> locationList;

  CustomSearchDelegate({required this.locationList});

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];
    int item;
    for (item = 0; item < locationList.length; item++) {
      if (locationList[item][0].toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(locationList[item][0]);
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
    for (item = 0; item < locationList.length; item++) {
      if (locationList[item][0].toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(locationList[item][0]);
      }
    }
    return ListView.builder(
        itemCount: matchQuery.length,
        itemBuilder: (context, index) {
          var result = matchQuery[index];
          return InkWell(
            onTap: () => close(context, matchQuery[index]),
            child: ListTile(
              leading: Text(
                result,
                style: const TextStyle(fontSize: 20),
              ),
            ),
          );
        });
  }
}
