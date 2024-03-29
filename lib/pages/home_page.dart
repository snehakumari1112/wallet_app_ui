import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:wallet_app_ui/pages/my_button.dart';
import 'package:wallet_app_ui/pages/my_list_tile.dart';
import 'package:wallet_app_ui/pages/util/my_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Colors.pink,
          child: Icon(
            Icons.monetization_on,
            size: 32,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          color: Colors.grey[200],
          child: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.home,
                    size: 32,
                    color: Colors.pink[200],
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.settings,
                    size: 32,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ),
        body: SafeArea(
            child: Column(children: [
          //app bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: const [
                    Text(
                      'My ',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      ' Cards',
                      style: TextStyle(
                        fontSize: 28,
                      ),
                    ),
                  ],
                ),

                // plus button

                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.grey[400],
                    shape: BoxShape.circle,
                  ),
                  child: Icon(Icons.add),
                ),
              ],
            ),
          ),

          const SizedBox(
            height: 25,
          ),
          // cards
          Container(
            height: 200,
            child: PageView(
              scrollDirection: Axis.horizontal,
              controller: _controller,
              children: [
                MyCard(
                  balance: 5250.20,
                  cardNumber: 12345678,
                  expiryMonth: 10,
                  expiryYear: 24,
                  color: Colors.deepPurple[300],
                ),
                MyCard(
                  balance: 342.23,
                  cardNumber: 12345678,
                  expiryMonth: 11,
                  expiryYear: 23,
                  color: Colors.deepOrange[300],
                ),
                MyCard(
                  balance: 420.42,
                  cardNumber: 12345678,
                  expiryMonth: 8,
                  expiryYear: 22,
                  color: Colors.pink[300],
                ),
              ],
            ),
          ),

          SizedBox(
            height: 25,
          ),

          SmoothPageIndicator(
            controller: _controller,
            count: 3,
            effect: ExpandingDotsEffect(
              activeDotColor: Colors.grey.shade800,
            ),
          ),
          SizedBox(
            height: 20,
          ),

          // 3 buttons  -> send + pay + bills
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                MyButton(
                  iconImagePath: 'lib/icons/send-money.png',
                  buttonText: 'Send',
                ),
                MyButton(
                  iconImagePath: 'lib/icons/credit-card.png',
                  buttonText: 'Pay',
                ),
                MyButton(
                  iconImagePath: 'lib/icons/bill.png',
                  buttonText: 'Bills',
                ),
              ],
            ),
          ),

          SizedBox(
            height: 40,
          ),

          // column -> stats + transaction

          Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Column(
                  children: const [
                    MyListTile(
                      iconImagePath: 'lib/icons/graph.png',
                      tileTitle: 'Statistics',
                      tileSubTitle: 'Payments and Income',
                    ),
                    MyListTile(
                      iconImagePath: 'lib/icons/transaction.png',
                      tileTitle: 'Transactions',
                      tileSubTitle: 'Transaction History',
                    ),
                  ],
                ),
              ),
            ],
          )
        ])));
  }
}
