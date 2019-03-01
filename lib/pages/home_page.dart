import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {

  String showText='no message';

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: Scaffold(
        appBar: AppBar(title: Text('request data'),),
        body: SingleChildScrollView(
          child:Column(
            children: <Widget>[
              RaisedButton(
                onPressed: (){
                  _jike();
                },
                child: Text('request data'),
              ),
              Text(showText)
            ],
          ),
        ),
      ),
    );
  }

  void _jike(){
    print('start request data......................');
    getHttp().then((val){
        setState(() {
          showText=val['data'].toString();
        });
      }
    );
  }

  Future getHttp() async{

    try{
      Response response;

      Dio dio=new Dio();

      response=await dio.get("");
    }catch(e){
      print(e.toString());
    }


  }
}







/*class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController typeController = TextEditingController();
  String showText='欢迎您来到没好人间';
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(title: Text('美好人间'),),
        body:SingleChildScrollView(
          child: Container(
            child: Column(
              children: <Widget>[
                TextField(
                  controller: typeController,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(10.0),
                      labelText: '美女类型',
                      helperText: '请输入你喜欢的类型'
                  ),
                  autofocus: false,
                ),
                RaisedButton(
                  onPressed: (){
                    _choiceAction();
                  },
                  child: Text('选择完毕'),
                ),
                Text(
                  showText,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                )
              ],
            ),
          ),
        ),
        resizeToAvoidBottomPadding: false, //输入框抵住键盘
    );
  }
  void _choiceAction(){
    print('开始选择你喜欢的类型.............');
    if(typeController.text.toString()==''){
      showDialog(context: context,builder: (context)=>AlertDialog(title: Text('美女类型不能为空'),));
    }else{
      getHttp(typeController.text.toString()).then((val){

        setState(() {
          showText=val['data']['name'].toString();
        });
      });
    }
  }
  Future getHttp(String TypeText) async{

    try{

      Response response;

      var  data={'name':TypeText};

      response=await Dio().get("https://www.easy-mock.com/mock/5c60131a4bed3a6342711498/baixing/dabaojian"
      ,queryParameters: data);

      return response.data;
    }catch(e){
      return print(e);
    }

  }
}*/






/*class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    getHttp();
    return Scaffold(
      body: Center(
         child: Text('HomePage'),
      ),
    );
  }
  
  void getHttp() async{
    print("start");
    try{
      print("gagaga");
      Response response;
      response=await Dio().get("https://www.easy-mock.com/mock/5c60131a4bed3a6342711498/baixing/dabaojian?name=大胸美女");
      print("gagaga");
      return  print(response.toString());
    }catch(e){
      print("error");
      return print(e.toString());
    }
    
  }
}*/
