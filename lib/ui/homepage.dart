import 'dart:convert';
import 'dart:io';

import 'package:assessment/db/connect.dart';
import 'package:assessment/model/list_choice.dart';
import 'package:assessment/ui/history.dart';
import 'package:flutter/material.dart';
import '../widget/widget_drawer.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart' show get;
import 'package:path_provider/path_provider.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var images;
  String keyWord = 'Computer'; 

  int currentPage  = 5;
  int size= 15;
  int totelPages=2;

  List<ChoiceModel> listChoice;
  var now = new DateTime.now();
  String photo;

  ScrollController _scrollController=ScrollController();

  List<dynamic> hits=[];
  
  @override
  Widget build(BuildContext context) {
    return FutureBuilder <List<ChoiceModel>>(
      future: DbProvider.db.getBackground(),
      builder: (BuildContext context, AsyncSnapshot<List<ChoiceModel>> snapshot) { 
      if (snapshot.hasData) {
        return Container(
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.red,
              title: Text('My Assessment'),
              actions: <Widget>[
                IconButton(
                  icon: Icon(Icons.history), 
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HistoryPage()),
                    );
                  },
                )
              ],
            ),
            drawer: Scaffold(
              backgroundColor: Colors.transparent,
              body: DrawerWidget()
            ),
            body: Container(
              decoration: BoxDecoration(
                image: DecorationImage(image: NetworkImage(snapshot.data[0].image),
                fit: BoxFit.cover)
              ),
              child: (images==null        
                ?Center(
                  child: Text('Tap the button to load images.', style: TextStyle(color: Colors.red, fontSize: 16),),
                )
                :ListView.builder(
                  itemCount: (images==null?0:hits.length),
                  controller: _scrollController,
                  itemBuilder: (context,index){
                    return Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Card(
                        child: Container(
                          width: double.infinity,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                              Container(
                                width: double.infinity,
                                  child:Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Card(
                                      child: GestureDetector(
                                        onTap: () { 
                                          DbProvider.db.addChoice(
                                            ChoiceModel(
                                              image: hits[index]['previewURL'],
                                              date: now.toString(),
                                              status: '1',
                                            ),
                                            hits[index]['previewURL'],
                                          );
                                          getImage(keyWord);
                                        },
                                        child: Image.network(
                                          hits[index]['previewURL'],
                                          fit: BoxFit.fitWidth,
                                        )
                                      ),
                                    ),
                                  ),
                              )
                            ],
                          ),
                        ),
                        ),
                    );
                  })
                ),
            ),
            floatingActionButton: FloatingActionButton(
              backgroundColor: Colors.red,
              child: Icon(Icons.list),
              onPressed: (() => getImage(keyWord)),
            ),
          ),
        );
      }else{
        return Container(
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.red,
              title: Text('My Assessment'),
              actions: <Widget>[
                IconButton(
                  icon: Icon(Icons.history), 
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HistoryPage()),
                    );
                  },
                )
              ],
            ),
            drawer: Scaffold(
              backgroundColor: Colors.transparent,
              body: DrawerWidget()
            ),
            body: Container(
              child: (images==null        
                ?Center(
                  child: Text('Tap the button to load images.', style: TextStyle(color: Colors.red, fontSize: 16),),
                )
                :ListView.builder(
                  itemCount: (images==null?0:hits.length),
                  controller: _scrollController,
                  itemBuilder: (context,index){
                    return Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Card(
                        child: Container(
                          width: double.infinity,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                              Container(
                                width: double.infinity,
                                  child:Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Card(
                                      child: GestureDetector(
                                        onTap: () { 
                                          DbProvider.db.addChoice(
                                            ChoiceModel(
                                              image: hits[index]['previewURL'],
                                              date: now.toString(),
                                              status: '1',
                                            ),
                                            hits[index]['previewURL'],
                                          );
                                          getImage(keyWord);
                                        },
                                        child: Image.network(
                                          hits[index]['previewURL'],
                                          fit: BoxFit.fitWidth,
                                        )
                                      ),
                                    ),
                                  ),
                              )
                            ],
                          ),
                        ),
                        ),
                    );
                  })
                ),
            ),
            floatingActionButton: FloatingActionButton(
              backgroundColor: Colors.red,
              child: Icon(Icons.list),
              onPressed: (() => getImage(keyWord)),
            ),
          ),
        );
      }
      }
    );
  }
  void getImage(String keyWord) {
    String url = "https://pixabay.com/api/?"
      "key=16582589-68a2e0e5d7a78080a8fa51cbe"
      "&q=${keyWord}"
      "&page=${currentPage}"
      "&per_page=${size}";
    http.get(url).then((onResp) {
      setState(() {
        this.images=json.decode(onResp.body);
        hits.addAll(images['hits']);     
      });
    }).catchError((onError){
      print(onError);
    });
  }
}