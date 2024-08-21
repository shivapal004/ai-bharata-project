import 'package:ai_bharata_project/services/web_socket_service.dart';
import 'package:flutter/material.dart';
import '../helper/global.dart';
import '../model/ampiyData.dart';

class CoinPage extends StatefulWidget {
  const CoinPage({super.key});

  @override
  State<CoinPage> createState() => _CoinPageState();
}

class _CoinPageState extends State<CoinPage> {

  late WebSocketService _webSocketService;
  List<Data> _dataList = [];
  final _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _webSocketService = WebSocketService(
      url: 'ws://prereg.ex.api.ampiy.com/prices',
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
    return GestureDetector(
      onTap: (){
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("COINS", style: TextStyle(fontWeight: FontWeight.bold, fontSize:  18),),
          backgroundColor: Colors.white,
          elevation: 1,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            children: [

              const SizedBox(height: 15,),
              TextFormField(
                controller: _controller,
                decoration: InputDecoration(
                  suffixIcon: const Icon(Icons.search),
                  hintText: 'Search',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Colors.black, strokeAlign: 10)
                  )
                ),
                onChanged: (String value){
                  setState(() {

                  });
                },
              ),
              const SizedBox(height: 15,),
              Expanded(
                  child: _dataList.isEmpty
                      ? const Center(child: CircularProgressIndicator())
                      : ListView.builder(
                          itemCount: _dataList.length,
                          itemBuilder: (context, index) {
                            final data = _dataList[index];
                            if(_controller.text.isEmpty){
                              return ListTile(
                                leading: CircleAvatar(
                                    backgroundColor: Colors.blue,
                                    child: Text(data.s.substring(0,1), style: const TextStyle(fontSize: 24),)
                                ),
                                title: Text(
                                  data.s.substring(0,3),
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                                subtitle: Text(data.s),
                                trailing: SizedBox(
                                  width: mq.width * .44,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        "₹ ${data.c}",
                                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                                      ),
                                      SizedBox(width: mq.width * .01,),
                                      Container(
                                          height: mq.height * .035,
                                          width: mq.width * .2,
                                          padding: const EdgeInsets.all(4),
                                          decoration: BoxDecoration(
                                              border: Border.all(color: Colors.black)
                                          ),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Icon(
                                                data.P.startsWith('-') ? Icons.arrow_downward : Icons.arrow_upward,
                                                color: data.P.startsWith('-') ? Colors.red : Colors.green,
                                                size: 14,
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
                                      )

                                    ],
                                  ),
                                ),

                              );
                            }
                            else if(data.s.toLowerCase().contains(_controller.text.toLowerCase())){
                              return ListTile(
                                leading: CircleAvatar(
                                    backgroundColor: Colors.blue,
                                    child: Text(data.s.substring(0,1), style: const TextStyle(fontSize: 24))
                                ),
                                title: Text(
                                  data.s.substring(0,3),
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                                subtitle: Text(data.s),
                                trailing: SizedBox(
                                  width: mq.width * .44,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        "₹ ${data.c}",
                                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                                      ),
                                      SizedBox(width: mq.width * .01,),
                                      Container(
                                          height: mq.height * .035,
                                          width: mq.width * .2,
                                          padding: const EdgeInsets.all(4),
                                          decoration: BoxDecoration(
                                              border: Border.all(color: Colors.black)
                                          ),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Icon(
                                                data.P.startsWith('-') ? Icons.arrow_downward : Icons.arrow_upward,
                                                color: data.P.startsWith('-') ? Colors.red : Colors.green,
                                                size: 14,
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
                                      )

                                    ],
                                  ),
                                ),

                              );
                            }
                            else{
                              return Container();
                            }

                          },
                      )
              ),
              // StreamBuilder(
              //     stream: widget.channel.stream,
              //     builder: (context, snapshot){
              //       if(!snapshot.hasData){
              //         return const CircularProgressIndicator();
              //       }
              //       else{
              //         return Text("hello");
              //       }
              //     }
              // )

            ],
          ),
        ),
      ),
    );
  }
}
