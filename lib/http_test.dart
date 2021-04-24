import 'dart:convert';

import 'package:http/http.dart' as http;

main(){
  BR_MIG_AV_ACTR_FIND();  //배우조회
}
BR_MIG_AV_ACTR_FIND() async { 
    //var jsonString='{"brRq":"IN_DATA,PAGE_DATA","PAGE_DATA":{"PAGE_NUM":0,"PAGE_SIZE":300},"brRs":"OUT_DATA","IN_DATA":[{"SEARCH_NM":"코니시 유우"}] }';
    var jsonString='{"brRq":"IN_DATA,PAGE_DATA","PAGE_DATA":{"PAGE_NUM":0,"PAGE_SIZE":300},"brRs":"OUT_DATA","IN_DATA":[{}] }';
    http.Response response = await http.post(
       Uri.parse('http://127.0.0.1:8091/api/BR_MIG_AV_ACTR_FIND')
       , headers: {"content-type": "application/json"}
       , body : jsonString
       ); 
       print("aaa"); 
       //print(response.body); 
       print(utf8.decode(response.bodyBytes)); // 한글이 깨지는 문제를 해결
       print("bbb"); 
       //List data = jsonDecode(response.body); 
       //print("###"); print(data[1]['title']); 
}
