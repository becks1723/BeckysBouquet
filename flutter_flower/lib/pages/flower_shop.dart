import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyAppState extends ChangeNotifier {
  var inCart = <String>[];
  void addToCart(item) {
    if (!inCart.contains(item)) {
      inCart.add(item);
    }
    notifyListeners();
  }

  void removeCart(item) {
    if (inCart.contains(item)) {
      inCart.remove(item);
    }
    notifyListeners();
  }
}

class FlowerShop extends StatefulWidget {
  const FlowerShop({Key? key}) : super(key: key);

  @override
  State<FlowerShop> createState() => _FlowerShopState();
}

class _FlowerShopState extends State<FlowerShop> {
  var selectedIndex = 0;

  static List<Widget> allPages = <Widget>[
    const HomePage(),
    const CartPage(),
    const ShopPage()
  ];

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.width,
      width: MediaQuery.of(context).size.width,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Welcome! Take a look around!'),
          backgroundColor: Color.fromARGB(255, 101, 185, 253),
        ),
        body: Center(
          child: allPages.elementAt(selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
              backgroundColor: Colors.pink,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_basket),
              label: 'Cart',
              backgroundColor: Colors.pink,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: 'Shop',
              backgroundColor: Colors.pink,
            ),
          ],
          currentIndex: selectedIndex,
          selectedItemColor: Colors.black,
          onTap: onItemTapped,
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Hello'),
    );
  }
}

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var cartItems = appState.inCart;

    if (cartItems.isEmpty) {
      return const Center(
        child: Text('Nothing in cart!'),
      );
    }

    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Text('You have ${cartItems.length} items in your cart'),
        ),
        for (var i in cartItems)
          Column(
            children: [
              ListTile(
                leading: const Icon(Icons.star_border_purple500_rounded),
                title: Text(i),
              ),
              Align(
                  alignment: Alignment.centerRight,
                  child: ElevatedButton(
                      onPressed: () {
                        appState.removeCart(i);
                      },
                      child: const Text('Remove from cart')))
            ],
          )
      ],
    );
  }
}

class ShopPage extends StatelessWidget {
  const ShopPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shop'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Row(
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 40.0, right: 40.0),
                child: Text(
                  'Daisy',
                  textScaleFactor: 2,
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    appState.addToCart('Daisy');
                  },
                  child: const Text('Add to Cart')),
            ],
          ),
          Row(
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 40.0, right: 40.0),
                child: Text(
                  'Rose',
                  textScaleFactor: 2,
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    appState.addToCart('Rose');
                  },
                  child: const Text('Add to Cart')),
            ],
          ),
          Row(
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 40.0, right: 40.0),
                child: Text(
                  'Sunflower',
                  textScaleFactor: 2,
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    appState.addToCart('Sunflower');
                  },
                  child: const Text('Add to Cart')),
            ],
          ),
          Row(
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 40.0, right: 40.0),
                child: Text(
                  'Peony',
                  textScaleFactor: 2,
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    appState.addToCart('Peony');
                  },
                  child: const Text('Add to Cart')),
            ],
          ),
        ],
      ),
    );
  }
}
