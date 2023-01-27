
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:play_store_home_screen/utils/list_item_data.dart';
import '../utils/ListItem.dart';
import '../utils/custom_search_delegate.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  List<List<ListItemData>> item_list = [
    [
      ListItemData(
          name: 'Pubg',
          rating: '4.4',
          category: 'Battle',
          image: const Image(
            image: AssetImage('assets/icons/pubg.png'),
            width: 96.0,
            height: 96.0,
          )),
      ListItemData(
          name: 'Ludo',
          rating: '4.3',
          category: 'Battle',
          image: const Image(
            image: AssetImage('assets/icons/ludo.png'),
            width: 96.0,
            height: 96.0,
          )),
      ListItemData(
          name: 'Angry Birds',
          rating: '4.4',
          category: 'Timepass',
          image: const Image(
            image: AssetImage('assets/icons/angry-birds.png'),
            width: 96.0,
            height: 96.0,
          )),
      ListItemData(
          name: 'Carrom',
          rating: '4.4',
          category: 'Battle',
          image: const Image(
            image: AssetImage('assets/icons/carrom.jpg'),
            width: 96.0,
            height: 96.0,
          )),
      ListItemData(
          name: 'Asphalt 9',
          rating: '4.3',
          category: 'Battle',
          image: const Image(
            image: AssetImage('assets/icons/asphalt9.png'),
            width: 96.0,
            height: 96.0,
          )),
    ],
    [
      ListItemData(
          name: 'Ludo',
          rating: '4.3',
          category: 'Battle',
          image: const Image(
            image: AssetImage('assets/icons/ludo.png'),
            width: 96.0,
            height: 96.0,
          )),
      ListItemData(
          name: 'Angry Birds',
          rating: '4.4',
          category: 'Timepass',
          image: const Image(
            image: AssetImage('assets/icons/angry-birds.png'),
            width: 96.0,
            height: 96.0,
          )),
      ListItemData(
          name: 'Carrom',
          rating: '4.4',
          category: 'Battle',
          image: const Image(
            image: AssetImage('assets/icons/carrom.jpg'),
            width: 96.0,
            height: 96.0,
          )),
      ListItemData(
          name: 'Asphalt 9',
          rating: '4.3',
          category: 'Battle',
          image: const Image(
            image: AssetImage('assets/icons/asphalt9.png'),
            width: 96.0,
            height: 96.0,
          )),
      ListItemData(
          name: 'Pubg',
          rating: '4.4',
          category: 'Battle',
          image: const Image(
            image: AssetImage('assets/icons/pubg.png'),
            width: 96.0,
            height: 96.0,
          )),
    ],
    [
      ListItemData(
          name: 'Angry Birds',
          rating: '4.4',
          category: 'Timepass',
          image: const Image(
            image: AssetImage('assets/icons/angry-birds.png'),
            width: 96.0,
            height: 96.0,
          )),
      ListItemData(
          name: 'Carrom',
          rating: '4.4',
          category: 'Battle',
          image: const Image(
            image: AssetImage('assets/icons/carrom.jpg'),
            width: 96.0,
            height: 96.0,
          )),
      ListItemData(
          name: 'Asphalt 9',
          rating: '4.3',
          category: 'Battle',
          image: const Image(
            image: AssetImage('assets/icons/asphalt9.png'),
            width: 96.0,
            height: 96.0,
          )),
      ListItemData(
          name: 'Pubg',
          rating: '4.4',
          category: 'Battle',
          image: const Image(
            image: AssetImage('assets/icons/pubg.png'),
            width: 96.0,
            height: 96.0,
          )),
      ListItemData(
          name: 'Ludo',
          rating: '4.3',
          category: 'Battle',
          image: const Image(
            image: AssetImage('assets/icons/ludo.png'),
            width: 96.0,
            height: 96.0,
          )),
    ],
    [
      ListItemData(
          name: 'Carrom',
          rating: '4.4',
          category: 'Battle',
          image: const Image(
            image: AssetImage('assets/icons/carrom.jpg'),
            width: 96.0,
            height: 96.0,
          )),
      ListItemData(
          name: 'Asphalt 9',
          rating: '4.3',
          category: 'Battle',
          image: const Image(
            image: AssetImage('assets/icons/asphalt9.png'),
            width: 96.0,
            height: 96.0,
          )),
      ListItemData(
          name: 'Pubg',
          rating: '4.4',
          category: 'Battle',
          image: const Image(
            image: AssetImage('assets/icons/pubg.png'),
            width: 96.0,
            height: 96.0,
          )),
      ListItemData(
          name: 'Ludo',
          rating: '4.3',
          category: 'Battle',
          image: const Image(
            image: AssetImage('assets/icons/ludo.png'),
            width: 96.0,
            height: 96.0,
          )),
      ListItemData(
          name: 'Angry Birds',
          rating: '4.4',
          category: 'Timepass',
          image: const Image(
            image: AssetImage('assets/icons/angry-birds.png'),
            width: 96.0,
            height: 96.0,
          )),
    ]
  ];
  List<String> top_list = [
    'For you',
    'Top charts',
    'Children',
    'Events',
    'Premium',
    'Categories',
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
            systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarColor: Colors.white60,
            ),
            backgroundColor: Colors.cyan.shade600,
            leading: Builder(builder: (context) {
              return IconButton(
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                icon: Icon(Icons.menu),
              );
            }),
            titleSpacing: 2.0,
            title: const Text('Play Store'),
            actions: [
              IconButton(
                onPressed: () {
                  showSearch(
                    context: context,
                    delegate: CustomSearchDelegate(item_list: item_list),
                  );
                },
                icon: const Icon(
                  Icons.search,
                  color: Colors.white,
                  size: 30.0,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.more_vert,
                  color: Colors.white,
                  size: 30.0,
                ),
              )
            ]),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const TabBar(
                isScrollable: true,
                tabs: [
                  Tab(
                    child: Text(
                      'For you',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Tab(
                    child: Text('Top Charts',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold)),
                  ),
                  Tab(
                    child: Text('Children',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold)),
                  ),
                  Tab(
                    child: Text('Categories',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold)),
                  ),
                  Tab(
                    child: Text('Events',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold)),
                  )
                ],
              ),
              Container(
                decoration: const BoxDecoration(color: Colors.white),
                height: 200.0,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: item_list[0].length,
                    itemBuilder: (context, index) {
                      return ListItem(data: item_list[0][index]);
                    }),
              ),
              Container(
                decoration: const BoxDecoration(color: Colors.white),
                height: 200.0,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: item_list[1].length,
                    itemBuilder: (context, index) {
                      return ListItem(data: item_list[1][index]);
                    }),
              ),
              Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                height: 200.0,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: item_list[2].length,
                    itemBuilder: (context, index) {
                      return ListItem(data: item_list[2][index]);
                    }),
              ),
              Container(
                decoration: const BoxDecoration(color: Colors.white),
                height: 200.0,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: item_list[3].length,
                    itemBuilder: (context, index) {
                      return ListItem(data: item_list[3][index]);
                    }),
              ),
            ],
          ),
        ),
        drawer: Drawer(
            child: Container(
          color: Colors.black87,
          child: ListView(
            children: [
              ListTile(
                trailing: Builder(builder: (context) {
                  return IconButton(
                      onPressed: () {
                        Scaffold.of(context).closeDrawer();
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ));
                }),
              ),
              const ListTile(
                leading: Text(
                  'Hello',
                  style: TextStyle(color: Colors.white, fontSize: 20.0),
                ),
              ),
              const ListTile(
                leading: Text('Challo',
                    style: TextStyle(color: Colors.white, fontSize: 20.0)),
              )
            ],
          ),
        )),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          backgroundColor: Colors.cyan,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.grey.shade800,
          unselectedItemColor: Colors.grey.shade200,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.gamepad_rounded),
              label: "Games",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.apps),
              label: "Games",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.local_offer_outlined),
              label: "Games",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.bookmarks_sharp),
              label: "Games",
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
