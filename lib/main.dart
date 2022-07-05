import 'package:book_app/book_content/book.dart';
import 'package:flutter/material.dart';
import 'book_content/bookobjectlist.dart';
import 'components/drawer_header.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'book app',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: GFG(),
    );
  }
}

// This is the widget that will be shown
// as the homepage of your application.
class GFG extends StatefulWidget {
  const GFG({Key? key}) : super(key: key);
  @override
  State<GFG> createState() => _GFGState();
}

class _GFGState extends State<GFG> {
  bool _showsearch = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
            const MyHeaderDrawer(),
            GestureDetector(
              onTap: () {},
              child: const ListTile(
                leading: Icon(Icons.home),
                title: Text("Home"),
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: const ListTile(
                leading: Icon(
                  Icons.notes_sharp,
                ),
                title: Text("Chapters"),
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: const ListTile(
                leading: Icon(Icons.receipt),
                title: Text("Section"),
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: const ListTile(
                leading: Icon(Icons.search),
                title: Text("Search"),
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: const ListTile(
                leading: Icon(Icons.help_center),
                title: Text("Adviser"),
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: const ListTile(
                leading: Icon(Icons.account_box),
                title: Text("About"),
              ),
            ),
            const Divider(),
            const ListTile(
              leading: Text("More"),
            ),
            GestureDetector(
              onTap: () {},
              child: const ListTile(
                leading: Icon(Icons.help_center),
                title: Text("Adviser"),
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: const ListTile(
                leading: Icon(Icons.share),
                title: Text("Share"),
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: const ListTile(
                leading: Icon(Icons.star_half),
                title: Text("Rate Us"),
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [


          
        ],
      ),
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Pakistan Penel code",
        ),
        actions: [
          _showsearch
              ? IconButton(
                  onPressed: () {
                    // method to show the search bar
                    showSearch(
                        context: context,
                        // delegate to customize the search bar
                        delegate: CustomSearchDelegate());
                  },
                  icon: const Icon(Icons.search),
                )
              : SizedBox(),
          // AnimSearchBar(
          //   width: 400,
          //   textController: textController,
          //   onSuffixTap: () {
          //     setState(() {
          //       textController.clear();
          //     });
          //   },
          // ),
        ],
      ),
    );
  }
}

class CustomSearchDelegate extends SearchDelegate {
// Demo list to show querying

// first overwrite to
// clear the search text
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

// second overwrite to pop out of search menu
  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: Icon(Icons.arrow_back),
    );
  }

// third overwrite to show query result
  @override
  Widget buildResults(BuildContext context) {
    List<Book> matchQuery = [];
    for (var item in searchTerms) {
      if (item.chapterNo.toLowerCase().contains(query.toLowerCase()) ||
          item.chapterName.toLowerCase().contains(query.toLowerCase()) ||
          item.topic.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(item);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          leading: Text(
            "${index + 1}",
            style: const TextStyle(
              fontSize: 30,
            ),
          ),
          title: Text(
            result.chapterNo,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
          subtitle: Text(result.topic),
        );
      },
    );
  }

// last overwrite to show the
// querying process at the runtime
  @override
  Widget buildSuggestions(BuildContext context) {
    List<Book> matchQuery = [];
    for (var item in searchTerms) {
      if (item.chapterNo.toLowerCase().contains(query.toLowerCase()) ||
          item.chapterName.toLowerCase().contains(query.toLowerCase()) ||
          item.topic.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(item);
      }
    }

    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          leading: Text(
            "${index + 1}",
            style: const TextStyle(
              fontSize: 30,
            ),
          ),
          title: Text(
            result.chapterNo,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
          subtitle: Text(result.topic),
        );
      },
    );
  }
}
