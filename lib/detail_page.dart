import 'package:flutter/material.dart';
import 'package:flutter_ui_study_sliver/TravelBean.dart';

class DetailPage extends StatefulWidget {
  final TravelBean bean;
  DetailPage(this.bean, {Key key}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  final double expandedHeight = 400.0;
  final double roundedContainerHeight = 50.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          CustomScrollView(
            slivers: <Widget>[
              _buildSliverHead(),
              SliverToBoxAdapter(
                child: _buildDetail(),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _buildSliverHead() {
    return SliverPersistentHeader(
      delegate: DetailSliverDelegate(
        expandedHeight, widget.bean, roundedContainerHeight
      ),
    );
  }

  Widget _buildDetail() {
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _buildUserInfo(),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
            child: Text(
              "The balearic Lsnaled,The Lsnaled,The balea balearic Lsnaled,"
              "The balearic Lsnaled,Lsnaled,The balea The balearic Lsnaled,"
              "The balearic Lsnaled,Lsnaled,The balea The balearic Lsnaled,"
              "The balearic Lsnaled,Lsnaled,The balea The balearic Lsnaled,"
              "The balearic Lsnaled,Lsnaled,The balea The balearic Lsnaled,"
              "The balearic Lsnaled,The balearic Lsnaled,The balea Lsnaled,"
              "The balearic Lsnaled,The balearic Lsnaled,",
              style: TextStyle(
                color: Colors.black38,
                height: 1.4,
                fontSize: 14,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 15,
              right: 30,
              top: 10,
              bottom: 10,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Featured",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    letterSpacing: 1.6,
                  ),
                ),
                Text(
                  "View all",
                  style: TextStyle(
                    color: Colors.deepOrange,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          // SizedBox(height: 120, child: FeaturedWidget()),
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: 15,
              horizontal: 15,
            ),
            child: Text(
              "The balearic Lsnaled,The Lsnaled,The balea balearic Lsnaled,"
              "The balearic Lsnaled,Lsnaled,The balea The balearic Lsnaled,"
              "The balearic Lsnaled,Lsnaled,The balea The balearic Lsnaled,"
              "The balearic Lsnaled,Lsnaled,The balea The balearic Lsnaled,"
              "The balearic Lsnaled,Lsnaled,The balea The balearic Lsnaled,"
              "The balearic Lsnaled,Lsnaled,The balea ",
              style: TextStyle(
                color: Colors.black38,
                height: 1.4,
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUserInfo() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
      child: Row(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Image.asset(
              widget.bean.url,
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 10,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  widget.bean.name,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                    "Writer, Wonderlust",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                    ),
                  )
              ],
            ),
          ),
          Spacer(),
          Icon(
            Icons.share,
            color: Colors.black54,
          )
        ],
      ),
    );
  }
}

class DetailSliverDelegate extends SliverPersistentHeaderDelegate {
  final double expandedHeight;
  // final String url;
  final TravelBean bean;
  final double roundedContainerHeight;

  DetailSliverDelegate(this.expandedHeight, this.bean, this.roundedContainerHeight);

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => 0;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return  Stack(
      children: <Widget>[
        Image.asset(
          bean.url,
          width: MediaQuery.of(context).size.width,
          height: expandedHeight,
          fit: BoxFit.cover,
        ),
        Positioned(
          top: expandedHeight - roundedContainerHeight - shrinkOffset,
          left: 0,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: roundedContainerHeight,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              )
            ),
          ),
        ),
        Positioned(
          top: expandedHeight - 120 - shrinkOffset,
          left: 30,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                bean.name,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                ),
              ),
              Text(
                bean.location,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}