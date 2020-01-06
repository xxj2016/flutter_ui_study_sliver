import 'package:flutter/material.dart';
import 'package:flutter_ui_study_sliver/TravelBean.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 15),
            child: Icon(
              Icons.menu,
              color: Colors.black,
            ),
          )
        ],
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
            child: Text(
              "Travel Blog",
              style: TextStyle(
                color: Colors.black,
                fontSize: 25.0,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: TravelWidget(),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Most Popular",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),
                Text(
                  "View all",
                  style: TextStyle(
                    color: Colors.deepOrange,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: MostPopularWidget(),
          )
        ],
      ),
    );
  }
}

class MostPopularWidget extends StatelessWidget {
  List<TravelBean> _list = TravelBean.generateMostPopularBean();

  MostPopularWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 15),
      scrollDirection: Axis.horizontal,
      itemCount: _list.length,
      itemBuilder: (BuildContext context, int index) {
        var bean = _list[index];
        return GestureDetector(
          onTap: () {},
          child: Hero(
            tag: bean.url,
            child: Stack(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(bottom: 30.0, right: 10.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Image.asset(
                      bean.url,
                      width: 130,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 50,
                  left: 15,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Material(
                        color: Colors.transparent,
                        child: Text(
                          bean.location,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        ),
                      ),
                      Material(
                        color: Colors.transparent,
                        child: Text(
                          bean.name,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15.0
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

class TravelWidget extends StatelessWidget {
  List<TravelBean> _list = TravelBean.generateTravelBean();

  TravelWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: PageController(viewportFraction: 0.85),
      itemCount: _list.length,
      itemBuilder: (context, index) {
        var bean = _list[index];
        return GestureDetector(
          onTap: () {},
          child: Hero(
            tag: bean.url,
            child: Stack(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(bottom: 30, right: 10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      bean.url,
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 80,
                  left: 15,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Material(
                        color: Colors.transparent,
                        child: Text(
                          bean.location,
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 15,
                          ),
                        ),
                      ),
                      Material(
                        color: Colors.transparent,
                        child: Text(
                          bean.name,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 30,
                  child: Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
