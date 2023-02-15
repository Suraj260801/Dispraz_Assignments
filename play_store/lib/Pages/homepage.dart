import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:play_store_home_screen/utils/custom_container.dart';
import 'package:play_store_home_screen/utils/helper_container.dart';
import 'package:play_store_home_screen/utils/list_item_data.dart';
import '../utils/ListItem.dart';
import '../utils/custom_search_delegate.dart';
import '../utils/my_lists.dart';
import '../utils/tab_bar_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  final List<List<ListItemData>> itemList = MyLists().itemList;
  final List<String> topList = MyLists().topList;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 50,
          elevation: 0,
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Colors.white60,
          ),
          backgroundColor: Colors.white,
          title: Container(
            margin: const EdgeInsets.all(0),
            padding: const EdgeInsets.fromLTRB(10, 0, 5, 0),
            decoration: BoxDecoration(
                color: Colors.blueGrey.shade100, borderRadius: BorderRadius.circular(30)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(
                  Icons.search,
                  color: Colors.black,
                ),
                TextButton(
                  child: const Text('Search for apps & games',
                      style: TextStyle(color: Colors.black, fontSize: 20)),
                  onPressed: () {
                    showSearch(
                      context: context,
                      delegate: CustomSearchDelegate(item_list: itemList),
                    );
                  },
                ),
                const Icon(
                  Icons.mic,
                  color: Colors.black,
                ),
                const CircleAvatar(
                  backgroundColor: Colors.blue,
                  child: Text('S'),
                )
              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              const TabBar(
                indicatorWeight: 2,
                indicatorPadding: EdgeInsets.all(0),
                isScrollable: true,
                tabs: [
                  TabBarItem(
                    category: 'For You',
                  ),
                  TabBarItem(
                    category: 'Top Charts',
                  ),
                  TabBarItem(
                    category: 'Children',
                  ),
                  TabBarItem(
                    category: 'Categories',
                  ),
                  TabBarItem(
                    category: 'Events',
                  ),
                ],
              ),
              Divider(
                height: 3,
                color: Colors.grey.shade900,
                thickness: 1,
              ),
              const HelperContainer(helperText: 'New & Updated games'),
              CustomContainer(
                itemList: itemList[0],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Row(
                  children: const [
                    Text(
                      'Ads.Suggested For You',
                      textAlign: TextAlign.start,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                  ],
                ),
              ),
              CustomContainer(
                itemList: itemList[1],
              ),
              const HelperContainer(helperText: 'Games we are playing'),
              CustomContainer(
                itemList: itemList[2],
              ),
              CustomContainer(
                itemList: itemList[3],
              )
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          backgroundColor: Colors.blueGrey.shade100,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.grey.shade800,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.gamepad_rounded),
              label: "Games",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.apps),
              label: "Apps",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.local_offer_outlined),
              label: "Offers",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.bookmarks_sharp),
              label: "Books",
            ),
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
