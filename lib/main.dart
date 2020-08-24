import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'ListItem.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Welcome to Flutter',
      home: new Scaffold(
          appBar: new AppBar(
            title: new Text('Welcome to Flutter'),
          ),
          body: new ListPage()),
    );
  }
}

class ListPage extends StatefulWidget {
  @override
  ListPageState createState() {
    return new ListPageState();
  }
}

class ListPageState extends State<ListPage> {
  List listData = [];

  @override
  void initState() {
    // TODO: implement initState
    print("initState1");

    super.initState();
    this.getListData();
    print("initState2");
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    print("build");
    return new ListView.builder(
        itemCount: this.listData.length,
        itemBuilder: (BuildContext context, int index) {
          Product data = listData[index];

          return Padding(
            padding: EdgeInsets.all(15),
            child: Row(
              children: [
                new ClipRRect(
                  borderRadius: BorderRadius.circular(4.0),
                  child: new Image(
                    image: NetworkImage(data.author.avatar),
                    width: 82,
                    height: 108,
                    fit: BoxFit.cover,
                  ),
                ),
                new Expanded(
                    child: Container(
                        margin: new EdgeInsets.only(left: 16.0),
                        child: new Column(
                          children: [
                            new Row(
                              children: [
                                new Text(
                                  data.title,
                                  style: new TextStyle(fontSize: 20),
                                )
                              ],
                            ),
                            new Row(children: [
                              new Text(
                                data.author.name,
                                style: new TextStyle(fontSize: 16),
                              ),
                              new Expanded(
                                  child: new Text(data.author.intro,
                                      style: new TextStyle(
                                        fontSize: 16,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1))
                            ]),
                            new Row(
                              children: [
                                new Text(data.unit,
                                    style: new TextStyle(fontSize: 16))
                              ],
                            ),
                            new Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                new Text(
                                  "￥${data.price.sale.toString()}",
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 250, 137, 25),
                                      fontSize: 16),
                                ),
                                new Container(
                                  width: 90,
                                  height: 32,
                                  decoration: new BoxDecoration(
                                    borderRadius: new BorderRadius.all(
                                      const Radius.circular(4.0),
                                    ),
                                    color: Color.fromARGB(255, 250, 137, 25),
                                  ),
                                  padding: EdgeInsets.fromLTRB(4, 2, 4, 2),
                                  child: new Align(
                                    alignment: Alignment.center,
                                    child: new Text("订阅",
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 255, 255, 255),
                                            fontSize: 16)),
                                  ),
                                )
                              ],
                            )
                          ],
                        )))
              ],
            ),
          );
        });
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    print("didChangeDependencies");
  }

  @override
  void didUpdateWidget(StatefulWidget oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    print("didUpdateWidget");
  }

  //获取数据
  void getListData() async {
    print("getListData");

    try {
      Response response = await Dio().get("http://localhost/api/list");
      print(response);

      //数据解析
      List listDataJson = response.data["data"];
      listDataJson.forEach((element) {
        print(element["title"]);
        Product p = Product.fromJson(element);
        listData.add(p);
      });

      //更新状态
      this.setState(() {});
    } catch (e) {
      print(e);
    }
  }
}
