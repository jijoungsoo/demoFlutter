
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:http/http.dart' as http;
import 'package:adult_demo/Image_view_page.dart';
import 'package:adult_demo/env_file.dart' as e;



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
     return MaterialApp(
        title: 'Startup Name Generator',            
                    home: RandomWords(),
       /*
      home: Scaffold(
        appBar: AppBar(
          title: Text('Welcome to Flutter'),
        ),
        body: Center(
             //child: Text(wordPair.asPascalCase),
             child: RandomWords(),
        ),
      ),
      */
    );
  }
}

class RandomWordsState extends State<RandomWords> {
   final _suggestions =  BR_MIG_AV_ACTR_FIND();
  final _biggerFont = const TextStyle(fontSize: 18.0);
   @override
  Widget build(BuildContext context) {
    
    return Scaffold(
        appBar: AppBar(
          title: Text('Startup Name Generator'),
        ),
        body: Column(
          children: <Widget>[
            Container(
              height: 40.0,
              child: Row(
                children: <Widget>[
                  Container(
                      padding: EdgeInsets.fromLTRB(20.0,4.0,4.0,4.0),
                      width: 70.0,
                      child: Text(
                        "NUM",
                        style: TextStyle(fontSize: 18),
                      )),
                  Container(
                      padding: EdgeInsets.fromLTRB(20.0,4.0,4.0,4.0),
                      width: 70.0,
                      child: Text(
                        "IDX",
                        style: TextStyle(fontSize: 18),
                      )),
                  Container(
                      padding: EdgeInsets.fromLTRB(16.0,4.0,4.0,4.0),
                      width: 80.0,
                      child: Text(
                        "나이",
                        style: TextStyle(fontSize: 18),
                      )),
                  Container(
                      padding: EdgeInsets.fromLTRB(20.0,4.0,4.0,4.0),
                      width: 60.0,
                      child: Text(
                        "SY",
                        style: TextStyle(fontSize: 18),
                      )
                  ),
                  Container(
                      padding: EdgeInsets.fromLTRB(20.0,4.0,4.0,4.0),
                      width: 100.0,
                      child: Text(
                        "생년월일",
                        style: TextStyle(fontSize: 18),
                      )
                  ),
                  Container(
                      padding: EdgeInsets.fromLTRB(20.0,4.0,4.0,4.0),
                      width: 90.0,
                      child: Text(
                        "이미지",
                        style: TextStyle(fontSize: 18),
                      )
                  ),
                  Container(
                      padding: EdgeInsets.fromLTRB(20.0,4.0,4.0,4.0),
                      width: 140.0,
                      child: Text(
                        "이름",
                        style: TextStyle(fontSize: 18),
                      )),
                  Container(
                      padding: EdgeInsets.fromLTRB(20.0,4.0,4.0,4.0),
                      width: 80.0,
                      child: Text(
                        "키",
                        style: TextStyle(fontSize: 18),
                      )),
                  Container(
                      padding: EdgeInsets.fromLTRB(20.0,4.0,4.0,4.0),
                      width: 160.0,
                      child: Text(
                        "SIZE",
                        style: TextStyle(fontSize: 18),
                      )
                  ),
                   Container(
                      padding: EdgeInsets.fromLTRB(20.0,4.0,4.0,4.0),
                      width: 70.0,
                      child: Text(
                        "D_C",
                        style: TextStyle(fontSize: 18),
                      )
                  ),
                   Container(
                      padding: EdgeInsets.fromLTRB(20.0,4.0,4.0,4.0),
                      width: 70.0,
                      child: Text(
                        "L_C",
                        style: TextStyle(fontSize: 18),
                      )
                  ),
                   Container(
                      padding: EdgeInsets.fromLTRB(20.0,4.0,4.0,4.0),
                      width: 70.0,
                      child: Text(
                        "DL_C",
                        style: TextStyle(fontSize: 18),
                      )
                  ),
                  
                ],
              ),
            ),
             Expanded(
              child:_buildSuggestions(),
             )
          ]        
        ),
      );
  }
    
  Widget  _buildSuggestions() {

    return FutureBuilder(
      future: _suggestions,
      builder: (context, snapshot) {
        if (!snapshot.hasData)
          return Center(
              child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation(Colors.amber),
          ));
        else {
          return  ListView.builder(
          padding: const EdgeInsets.all(16.0),
          itemCount: snapshot.data.length,
          itemBuilder: /*1*/ (context, i) {
            return _buildRow(snapshot.data[i],i);
          });
        }
      });
  }

  Widget _buildRow(Map pair,int i){
    return Row(
              children: <Widget>[
                Container(
                    padding: EdgeInsets.all(4.0),
                    width: 70.0,
                    child: Text(
                      i.toString(),
                      style: TextStyle(fontSize: 18),
                    )),
                Container(
                    padding: EdgeInsets.all(4.0),
                    width: 70.0,
                    child: SelectableText(
                      pair["ACTOR_IDX"].toString(),
                      style: TextStyle(fontSize: 18),
                    )),
                Container(
                  padding: EdgeInsets.all(4.0),
                  width: 80.0,
                  child: Text(
                    pair["AGE"].toString(),
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(4.0),
                  width: 60.0,
                  child: Text(
                    pair["SYNC"].toString(),
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                 Container(
                  padding: EdgeInsets.all(4.0),
                  width: 100.0,
                  child: Text(
                    pair["BIRTH"].toString(),
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(4.0),
                  width: 90.0,
                  child: GestureDetector(
                          child: Container(
                            width: 90,
                            child: Image.network("http://"+e.env_file.fileServer+"/ACTOR_IDX_PF_IMG/LS/"+pair["ACTOR_IDX"].toString(),height: 60),                            
                            ),                          
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) => ImageViewPage(path:"http://"+e.env_file.fileServer+"/ACTOR_IDX_PF_IMG/L/"+pair["ACTOR_IDX"].toString()))
                            );
                          },
                        ),

                  
                  
                ),
                
                Container(
                  padding: EdgeInsets.all(4.0),
                  width: 140.0,
                  child: SelectableText(
                    pair["NAME_KR"].toString(),
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(4.0),
                  width: 80.0,
                  child: Text(
                    pair["HEIGHT"].toString(),
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(4.0),
                  width: 160.0,
                  child: Text(
                    pair["SIZE"].toString(),
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                 Container(
                  padding: EdgeInsets.all(4.0),
                  width: 70.0,
                  child: Text(
                    pair["ACTOR_CMT_CNT"].toString(),
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                 Container(
                  padding: EdgeInsets.all(4.0),
                  width: 70.0,
                  child: Text(
                    pair["ACTOR_LK_CNT"].toString(),
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                 Container(
                  padding: EdgeInsets.all(4.0),
                  width: 70.0,
                  child: Text(
                    pair["ACTOR_DSLK_CNT"].toString(),
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                
                
              ],
            );
  }
}

class RandomWords extends StatefulWidget {
  @override
  RandomWordsState createState() => RandomWordsState();
}


Future<List> BR_MIG_AV_ACTR_FIND() async { 
    //var jsonString='{"brRq":"IN_DATA,PAGE_DATA","PAGE_DATA":{"PAGE_NUM":0,"PAGE_SIZE":300},"brRs":"OUT_DATA","IN_DATA":[{"SEARCH_NM":"코니시 유우"}] }';
    var jsonString='{"brRq":"IN_DATA,PAGE_DATA","PAGE_DATA":{"PAGE_NUM":0,"PAGE_SIZE":6000},"brRs":"OUT_DATA","IN_DATA":[{}] }';
    
    http.Response response = await http.post(


       Uri.parse('http://'+e.env_file.apiServer+'/api/BR_MIG_AV_ACTR_FIND')
       , headers: {"content-type": "application/json"}
       , body : jsonString
       ); 
       print("aaa"); 
       //print(response.body); 
       //print(utf8.decode(response.bodyBytes)); // 한글이 깨지는 문제를 해결
       print("bbb"); 
       Map<String, dynamic> data = jsonDecode(utf8.decode(response.bodyBytes)); 
        print("data.length=> "+data.length.toString());
        print("data.length=> "+data.length.toString());
        data.forEach((key, value) { 
              print(key.toString());
        });
        //print(data["OUT_DATA"]);
        var tmp =data["OUT_DATA"] ;
        print(tmp.length);
        print(tmp[0]);
        print(tmp[0]["ACTOR_IDX"]);
        
        return tmp;

}
