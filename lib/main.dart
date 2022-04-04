import 'package:flutter/material.dart';
import 'song.dart' as lagu;
import 'Galerry.dart' as galeri;
import 'video.dart' as video;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BelajarAppBar(),
    );
  }
}

class BelajarAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 3,
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                expandedHeight: 200.0,
                floating: false,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  title: Text("Ariana Grande",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                      )),
                  background: Image(
                    image: AssetImage('assets/ariana.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SliverPersistentHeader(
                pinned: true,
                delegate: _SliverAppBarDelegate(
                  TabBar(
                    labelColor: Colors.black87,
                    unselectedLabelColor: Colors.grey,
                    tabs: <Widget>[
                      new Tab(icon: new Icon(Icons.audiotrack), text: "Song"),
                      new Tab(icon: new Icon(Icons.collections), text: "Gallery"),
                      new Tab(icon: new Icon(Icons.video_settings), text: "Videos"),
                    ],
                  ),
                ),
              ),
            ];
          },
          body: TabBarView(
            children: <Widget>[
              new lagu.Songs(),
              new galeri.Galeri(),
              new video.Videos(),
            ],
          ),
        ),
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;
  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new Container(
      child: _tabBar,
      color: Colors.white,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}
