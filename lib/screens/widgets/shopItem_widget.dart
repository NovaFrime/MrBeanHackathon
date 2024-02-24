import 'package:flutter/material.dart';

class ShopItem {
  final String img;
  final String title;
  final String subtitle;
  final double rating;
  final double moneyPrice;
  final double beanPrice;

  ShopItem({
    required this.img,
    required this.title,
    required this.subtitle,
    required this.rating,
    required this.moneyPrice,
    required this.beanPrice,
  });
}

List<ShopItem> shopItems = [
  ShopItem(
    img: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRvpKh7QMBvAE9KILi92flWzs5mR58Gvk3ZMzExgHkeig&s',
    title: 'Item 1',
    subtitle: 'Subtitle 1',
    rating: 4.5,
    moneyPrice: 50.0,
    beanPrice: 2.0,
  ),
  ShopItem(
    img: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRvpKh7QMBvAE9KILi92flWzs5mR58Gvk3ZMzExgHkeig&s',
    title: 'Item 2',
    subtitle: 'Subtitle 2',
    rating: 4.0,
    moneyPrice: 30.0,
    beanPrice: 1.5,
  ),
  ShopItem(
    img: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRvpKh7QMBvAE9KILi92flWzs5mR58Gvk3ZMzExgHkeig&s',
    title: 'Item 2',
    subtitle: 'Subtitle 2',
    rating: 4.0,
    moneyPrice: 30.0,
    beanPrice: 1.5,
  ),
  ShopItem(
    img: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRvpKh7QMBvAE9KILi92flWzs5mR58Gvk3ZMzExgHkeig&s',
    title: 'Item 2',
    subtitle: 'Subtitle 2',
    rating: 4.0,
    moneyPrice: 30.0,
    beanPrice: 1.5,
  ),
  ShopItem(
    img: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRvpKh7QMBvAE9KILi92flWzs5mR58Gvk3ZMzExgHkeig&s',
    title: 'Item 2',
    subtitle: 'Subtitle 2',
    rating: 4.0,
    moneyPrice: 30.0,
    beanPrice: 1.5,
  ),
  ShopItem(
    img: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRvpKh7QMBvAE9KILi92flWzs5mR58Gvk3ZMzExgHkeig&s',
    title: 'Item 2',
    subtitle: 'Subtitle 2',
    rating: 4.0,
    moneyPrice: 30.0,
    beanPrice: 1.5,
  ),
  ShopItem(
    img: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRvpKh7QMBvAE9KILi92flWzs5mR58Gvk3ZMzExgHkeig&s',
    title: 'Item 2',
    subtitle: 'Subtitle 2',
    rating: 4.0,
    moneyPrice: 30.0,
    beanPrice: 1.5,
  ),
  // Add more ShopItem objects as needed
];

class ShopItemWidget extends StatelessWidget {
  final ShopItem shopItem;

  const ShopItemWidget({Key? key, required this.shopItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ShopItemDetailsPage(shopItem: shopItem),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 1,
              blurRadius: 5,
              offset: Offset(0, 1),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: 'item_image_${shopItem.title}_${shopItems.indexOf(shopItem)}',
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
                child: Image.network(
                  shopItem.img,
                  fit: BoxFit.cover,
                  height: 70,
                  width: double.infinity,
                  loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Center(
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded / (loadingProgress.expectedTotalBytes ?? 1)
                            : null,
                      ),
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    shopItem.title,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    shopItem.subtitle,
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.yellow),
                      Text(shopItem.rating.toString()),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "${shopItem.beanPrice} BEAN",
                        style: TextStyle(fontSize: 14, color: Colors.green[600]),
                      ),
                      SizedBox(width: 10),
                      Text(
                        "${shopItem.moneyPrice} VND",
                        style: TextStyle(fontSize: 14, color: Colors.black),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ShopItemDetailsPage extends StatelessWidget {
  final ShopItem shopItem;

  const ShopItemDetailsPage({Key? key, required this.shopItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Back to Home"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Hero(
            tag: 'item_image_${shopItem.title}_${shopItems.indexOf(shopItem)}',
            child: Column(
              children: [
                Carousel(imageUrls: [shopItem.img]),
                Text(shopItem.title, style: TextStyle(fontSize: 12)),
                Text(shopItem.subtitle, style: TextStyle(fontSize: 12)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Carousel extends StatefulWidget {
  Carousel({required this.imageUrls});
  final List<String> imageUrls;

  @override
  _CarouselState createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  late List<String> imageUrls;

  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    imageUrls = widget.imageUrls;
  }

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
      height: size / 2,
      decoration: BoxDecoration(
        color: index == _currentPage ? Color(0xff222222) : Colors.grey,
        borderRadius: BorderRadius.circular(size / 2),
      ),
    );
  }
}
