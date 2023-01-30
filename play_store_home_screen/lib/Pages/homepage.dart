import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:play_store_home_screen/tabs/mytab.dart';
import 'package:play_store_home_screen/utils/custom_container.dart';
import 'package:play_store_home_screen/utils/list_item_data.dart';
import 'package:play_store_home_screen/utils/navbar_item.dart';
import 'package:play_store_home_screen/utils/suggestions.dart';
import '../utils/ListItem.dart';
import '../utils/app_list.dart';
import '../utils/custom_search_delegate.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  List<List<ListItemData>> itemList=AppList().itemList;
  List<String> topList=AppList().topList;


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Colors.white60,
          ),
          backgroundColor: Colors.white,
          title: Container(
            height: 45.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25.0),
              color: Colors.grey.shade200,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Padding(
                  padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                  child: Icon(
                    Icons.search,
                    color: Colors.black,
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () {
                          showSearch(
                            context: context,
                            delegate:
                                CustomSearchDelegate(item_list: itemList),
                          );
                        },
                        child: const Text(
                          'Search for apps & games',
                          style: TextStyle(color: Colors.black, fontSize: 20.0),
                        ),
                      ),
                      const Icon(
                        Icons.mic,
                        color: Colors.black,
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(5, 0, 10, 0),
                  child: CircleAvatar(
                    child: Text('S'),
                  ),
                )
              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10, 2, 10, 2),
            child: Column(
              children: [
                TabBar(
                  labelColor: Colors.blue,
                  indicatorColor: Colors.blue,
                  indicatorSize: TabBarIndicatorSize.label,
                  indicatorWeight: 3.0,
                  isScrollable: true,
                  tabs: [
                    MyTab(category: 'For You'),
                    MyTab(category: 'Top Charts'),
                    MyTab(category: 'Children'),
                    MyTab(category: 'Categories'),
                    MyTab(category: 'Events'),
                  ],
                ),
                const Divider(
                  height: 1.5,
                  thickness: 1.0,
                  color: Colors.grey,
                ),
               const Suggestions(name: 'New & Updated Games'),
                CustomContainer(listItem: itemList[0]),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Ads.Suggested For You',
                          style: TextStyle(color: Colors.black, fontSize: 18),
                        )),
                  ],
                ),
                CustomContainer(listItem: itemList[1]),
                const Suggestions(name: 'Games we are playing'),
                CustomContainer(listItem: itemList[2]),
                CustomContainer(listItem: itemList[3]),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.black54,
          items: [
            NavbarItem(item: 'Games', icon: Icons.games).getNavItem(),
            NavbarItem(item: 'Apps', icon: Icons.apps).getNavItem(),
            NavbarItem(item: 'Movies', icon: Icons.local_offer_outlined)
                .getNavItem(),
            NavbarItem(item: 'Books', icon: Icons.bookmarks_sharp).getNavItem(),
          ],
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
      ),
    );
  }
}
