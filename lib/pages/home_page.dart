import 'package:flutter/material.dart';
import '../helper/global.dart';
import '../model/ampiyData.dart';
import '../services/web_socket_service.dart';
import '../widgets/bar_chart.dart';
import '../widgets/coin_card.dart';
import '../widgets/zone_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  late WebSocketService _webSocketService;
  List<Data> _dataList = [];

  @override
  void initState() {
    super.initState();
    _webSocketService = WebSocketService(
      url: 'ws://prereg.ex.api.ampiy.com/prices', // Replace with your WebSocket URL
      onDataReceived: (ampiyData) {
        setState(() {
          _dataList = ampiyData.data;
        });
      },
    );
    _webSocketService.sendSubscription();
  }

  @override
  void dispose() {
    _webSocketService.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: mq.height * .1),
              const Text("Welcome to AMPIY", style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                letterSpacing: 1
              ),),
              SizedBox(height: mq.height * .01,),
              const Text("Buy your first Crypto Asset today", style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500
              ),),
              SizedBox(height: mq.height * .015,),
              Container(
                  height: mq.height * .06,
                width: mq.width * .8,
                decoration: BoxDecoration(
                    color: blueColor,
                    borderRadius: BorderRadius.circular(15)
                ),
                child: const Center(child: Text("Verify Account", style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w500
                ),)),
              ),
              SizedBox(height: mq.height * .03,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      const Icon(Icons.add_circle, color: blueColor, size: 30,),
                      SizedBox(height: mq.height * .007,),
                      const Text("Buy")
                    ],
                  ),
                  Column(
                    children: [
                      const Icon(Icons.remove_circle, color: blueColor, size: 30,),
                      SizedBox(height: mq.height * .007,),
                      const Text("Sell")
                    ],
                  ),
                  Column(
                    children: [
                      const Icon(Icons.person, color: blueColor, size: 30,),
                      SizedBox(height: mq.height * .007,),
                      const Text("Referral")
                    ],
                  ),
                  Column(
                    children: [
                      const Icon(Icons.video_collection_outlined, color: blueColor, size: 30,),
                      SizedBox(height: mq.height * .007,),
                      const Text("Tutorial")
                    ],
                  )
        
                ],
              ),
              SizedBox(height: mq.height * .02,),
              Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Create Wealth with SIP',
                              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
                            ),
                            const SizedBox(height: 6),
                            const Text('Invest. Grow. Repeat. Grow your money with SIP now.',style: TextStyle(
                              fontSize: 12
                            ),),
                            const SizedBox(height: 12),
                            SizedBox(
                              width: 136,
                              height: 40,
                              child: ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    foregroundColor: Colors.white,
                                    backgroundColor: blueColor
                                  ),
                                  child: const Row(
                                    children: [
                                      Text("Start a SIP"),
                                      SizedBox(width: 5,),
                                      Icon(Icons.arrow_forward_ios, size: 15,)
                                    ],
                                  )
                              ),
                            )
                          ],
                        ),
                      ),
                      Image.asset("assets/images/investment.png", height: 50, width: 70,)
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20,),
              Row(
                children: [
                  Expanded(
                    child: buildOptionCard(
                      context,
                      Icons.calculate,
                      'SIP Calculator',
                      'Calculate Interests and Returns',
                    ),
                  ),
                  Expanded(
                    child: buildOptionCard(
                      context,
                      Icons.account_balance,
                      'Deposit INR',
                      'Use UPI or Bank Account to trade or buy SIP',
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20,),
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: 15,),
                  Text("Coins", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                ],
              ),
              _dataList.isEmpty
                  ? const Center(child: CircularProgressIndicator())
                  : ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        final data = _dataList[index];
                        return Container(
                          margin: const EdgeInsets.only(bottom: 4),
                          child: ListTile(
                            tileColor: Colors.grey.shade300,
                            leading: CircleAvatar(
                              backgroundColor: Colors.blue,
                                child: Text(data.s.substring(0,1), style: TextStyle(fontSize: 24))
                            ),
                            title: Text(
                              data.s,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.blue,
                              ),
                            ),
                            subtitle: Text('Current Price: ${data.c}'),
                            trailing: SizedBox(
                              width: 100,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(data.c),
                                  const SizedBox(height: 4),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Icon(
                                        data.P.startsWith('-') ? Icons.arrow_downward : Icons.arrow_upward,
                                        color: data.P.startsWith('-') ? Colors.red : Colors.green,
                                        size: 15,
                                        //   Icons.arrow_upward, size: 15,
                                      ),
                                      Text(
                                        '${data.P}%',
                                        style: TextStyle(
                                          color: data.P.startsWith('-') ? Colors.red : Colors.green,
                                          // color: Colors.green,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  )
                              
                                ],
                              ),
                            ),
                          ),
                        );
                      },
              ),
              SizedBox(
                width: 340,
                child: ElevatedButton(
                    onPressed: (){
                      const HomePage();
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => const CoinPage(),
                      //   ),
                      // ).then((_) {
                      //   final mainScreenState = MainScreen.mainScreenKey.currentState;
                      //   if (mainScreenState != null) {
                      //     mainScreenState.updateIndex(1); // Update index for CoinPage
                      //   }
                      // });
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: blueColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)
                      )
                    ),
                    child: const Text("View all")
                ),
              ),
              const SizedBox(height: 20,),
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: 15,),
                  Text("Market Variation Spectrum", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                ],
              ),
              const SizedBox(height: 20,),
              const SizedBox(
                height: 200,  // Adjust the height as needed
                width: double.infinity,  // Use the full width of the screen
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),  // Add padding if necessary
                  child: BarChartSample(),
                ),
              ),
              const SizedBox(height: 20,),
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: 15,),
                  Text("Hot Coins", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                ],
              ),
              const SizedBox(height: 20,),
              // const HotCoins(),
              _dataList.isEmpty
                  ? const Center(child: CircularProgressIndicator())
                  : SizedBox(
                height: 110, // Adjust height based on the design
                child: ListView.builder(
                  scrollDirection: Axis.horizontal, // Makes the list scrollable horizontally
                  itemCount: _dataList.length,
                  itemBuilder: (context, index) {
                    final data = _dataList[index];
                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 8),
                      child: Card(
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Container(
                          width: 150, // Adjust width to fit the design
                          padding: const EdgeInsets.all(12),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                data.s,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue,
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(height: 6),
                              Text('Price: ${data.c}'),
                              const SizedBox(height: 4),
                              Row(
                                children: [
                                  Icon(
                                    data.P.startsWith('-') ? Icons.arrow_downward : Icons.arrow_upward,
                                    color: data.P.startsWith('-') ? Colors.red : Colors.green,
                                    size: 15,
                                  ),
                                  Text(
                                    '${data.P}%',
                                    style: TextStyle(
                                      color: data.P.startsWith('-') ? Colors.red : Colors.green,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 20,),
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: 15,),
                  Text("Zones", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                ],
              ),
              // const SizedBox(height: 20,),
              Zones(),

        
            ],
          ),
        ),
      )
    );
  }

  Widget buildOptionCard(BuildContext context, IconData icon, String title, String subtitle) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 13),
            ),
            const SizedBox(height: 6),
            Text(
              subtitle,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 12),
            ),
            const SizedBox(height: 10), // Space between text and icons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(icon, size: 25, color: blueColor),
                const Icon(Icons.arrow_forward),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class HotCoins extends StatelessWidget {
  const HotCoins({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal, // Enables horizontal scrolling
      child: Row(
        children: const [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: CoinCard(name: "BTC", price: "₹50,15,352.96", change: "+1.11%"),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: CoinCard(name: "AMPYC", price: "₹1.16", change: "0.00%"),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: CoinCard(name: "ETH", price: "₹2,21,808.0", change: "+1.73%"),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: CoinCard(name: "DOGE", price: "₹15.32", change: "+2.34%"),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: CoinCard(name: "SOL", price: "₹5,678.90", change: "+0.89%"),
          ),
        ],
      ),
    );
  }
}


class Zones extends StatelessWidget {
  const Zones({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      childAspectRatio: 3 / 2,
      physics: const NeverScrollableScrollPhysics(),
      children: const [
        ZoneCard(name: "Ethereum Name Service", change: "+4.47%"),
        ZoneCard(name: "Gala", change: "+12.62%"),
        ZoneCard(name: "Frax Share", change: "+10.37%"),
        ZoneCard(name: "Solana", change: "+3.35%"),
      ],
    );
  }
}
