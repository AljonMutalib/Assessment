import 'package:assessment/model/list_choice.dart';
import 'package:flutter/material.dart';
import '../db/connect.dart';


class HistoryPage extends StatefulWidget {
  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('My Assessment'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.history), 
            onPressed: (){}
          )
        ],
      ),
      body: FutureBuilder<List<ChoiceModel>>(
        future: DbProvider.db.getChoice(),
        builder: (BuildContext context, AsyncSnapshot<List<ChoiceModel>> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                ChoiceModel item = snapshot.data[index];
                return Row(
                  children: <Widget>[            
                    Image.network(
                      item.image,
                      fit: BoxFit.fitWidth,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Container(  
                          padding: EdgeInsets.all(10),
                          child: Text(
                            //'test',
                            item.date,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.green,
                            )
                          ),
                        ),        
                      ]
                    ),
                  ]
                );
              },
            );
          } else {
            return Center(child: CircularProgressIndicator(backgroundColor: const Color(0xFF004d00),));
          }
        },
      )
    );
  }
}