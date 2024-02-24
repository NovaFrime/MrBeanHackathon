import 'package:flutter/material.dart';
import 'package:mrbean/screens/widgets/shopItem_widget.dart';
import 'trade_page.dart';
class HomePage extends StatelessWidget {
  final Function(int) onChangePage;
  const HomePage({super.key, required this.onChangePage});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffEEDACA),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Color(0xffFFFBF6),
                hintText: 'Search...',
                isDense: true,
                contentPadding: EdgeInsets.all(15),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.all(Radius.circular(12.0)),
                ),
              ),
            ),
            SizedBox(height: 10),
            Carousel(),
            SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                color: Color(0xffFFFBF6),
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
              height: 328,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    children: [
                      Row(
                        children: <Widget>[
                          CircleAvatar(
                            backgroundImage:
                            AssetImage('assets/avatars/dog.png'),
                            radius: 40,
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: "Lê Thành Danh",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                      ),
                                    ],
                                  ),
                                ),
                                RichText(
                                  text: TextSpan(
                                    children: [
                                      WidgetSpan(
                                        child: Image.asset(
                                          'assets/icons/bean.png',
                                          color: Colors.green[600],
                                          width: 17,
                                        ),
                                      ),
                                      TextSpan(
                                        text: " 1 ",
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 16),
                                      ),
                                      TextSpan(
                                        text: "BEAN (100g)",
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 16),
                                      ),
                                    ],
                                  ),
                                ),
                                RichText(
                                  text: TextSpan(
                                    children: [
                                      WidgetSpan(
                                          child: Icon(
                                            Icons.account_balance_wallet,
                                            size: 17,
                                          )),
                                      TextSpan(
                                        text: " 100 ",
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 16),
                                      ),
                                      TextSpan(
                                        text: "VND",
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 16),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      // _Googlemapifwehavethathere
                      SizedBox(height: 10),
                      Container(
                        decoration: BoxDecoration(
                          color: Color(0xffFFFBF6),
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              spreadRadius: 1,
                              blurRadius: 5,
                              offset:
                              Offset(0, 1), // changes position of shadow
                            ),
                          ],
                        ),
                        height: 160,
                      ),
                      SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: () => {
                        onChangePage(0)
                        },
                        style: ElevatedButton.styleFrom(
                            minimumSize: const Size(double.infinity,
                                42), // adjust the height as needed
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            backgroundColor: const Color(0xffDE9D45)),
                        child: const Text(
                          'CREATE COLLECTION FORM',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 35),
            Text(
              "Featuring Item",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
            ),
            GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: shopItems.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return ShopItemWidget(shopItem: shopItems[index]);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class Carousel extends StatefulWidget {
  @override
  _CarouselState createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  final List<String> imageUrls = [
    'https://i.pinimg.com/564x/c5/a6/b4/c5a6b4f1bc5f777881397d91d6a0616d.jpg',
    'https://dg6qn11ynnp6a.cloudfront.net/brands/15771674.madecoffee.350.jpg',
    'https://static.designboom.com/wp-content/uploads/2022/12/reuser-cup-designboom-04.jpg',
  ];

  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 200.0,
          child: PageView.builder(
            itemCount: imageUrls.length,
            itemBuilder: (context, index) {
              return buildItem(imageUrls[index]);
            },
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
          ),
        ),
        SizedBox(height: 10),
        buildDotIndicators(),
      ],
    );
  }

  Widget buildItem(String imageUrl) {
    return Container(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12.0),
        child: Image.network(
          imageUrl,
          fit: BoxFit.cover,
          width: double.infinity,
        ),
      ),
    );
  }

  Widget buildDotIndicators() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        imageUrls.length,
            (index) => buildDot(index),
      ),
    );
  }

  Widget buildDot(int index) {
    double size = 10.0;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5.0),
      width: size,
      height: size / 2, // Adjust the height to make it a rounded line
      decoration: BoxDecoration(
        color: index == _currentPage ? Color(0xff222222) : Colors.grey,
        borderRadius: BorderRadius.circular(size / 2),
      ),
    );
  }
}