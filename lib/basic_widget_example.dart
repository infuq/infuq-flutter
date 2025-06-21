import 'package:flutter/material.dart';

class BasicWidgetExample extends StatelessWidget {
  const BasicWidgetExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  State<MyHomePage> createState() {
    return _MyHomePageState();
  }

}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {

  static const List<String> _abs = ['A', 'B', 'S'];
  static const List<Tab> myTabs = <Tab>[
    Tab(text: 'LEFT', icon: Icon(Icons.android)),
    Tab(text: 'RIGHT', icon: Icon(Icons.android)),
  ];

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: myTabs.length);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("标题", style: TextStyle(color: Colors.red),),
        centerTitle: true,

        automaticallyImplyLeading: false,// 不使用默认
        leading: Icon(Icons.menu, color: Colors.red, size: 30,),// 左侧按钮
        flexibleSpace: Image.asset("images/pexels-sofamuzaqi.jpg", fit: BoxFit.cover,),// 背景

        // 末尾的操作按钮列表
        actions: [
          PopupMenuButton(
              onSelected: (val) => print('Selected item is $val'),
              icon: Icon(Icons.more_vert, color: Colors.red,),
              itemBuilder: (context) =>
                  List.generate(_abs.length, (index) => PopupMenuItem(value: _abs[index], child: Text(_abs[index])))
          ),
        ],
        bottom: TabBar(
          labelColor: Colors.red,
          unselectedLabelColor: Colors.white,
          controller: _tabController,
          isScrollable: false,
          indicatorColor: Colors.yellow,
          indicatorSize: TabBarIndicatorSize.tab,
          indicatorWeight: 5,
          tabs: myTabs,
        ),

      ),
      body: ListView(
        padding: const EdgeInsets.only(top: 10, bottom: 150),
        children: [
          Center(
            child: Text(
              "内容一",
              style: TextStyle(
                  color: Colors.white, // 设置文字颜色,不可以和foreground同时设置
                  fontSize: 20, // 字体大小
                  letterSpacing: 2, // 每个字符之间的间隔
                  background: Paint()..color = Colors.lightBlue), // 背景色
            ),
          ),
          Center(
            child: Text("为中华之崛起而读书",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  decoration: TextDecoration.underline, // 文字装饰线
                  decorationStyle: TextDecorationStyle.solid, // 文字装饰线的类型
                  decorationThickness: 1, // 装饰线的粗细
                  decorationColor: Colors.red,) // 装饰线的颜色
            ),
          ),

          // 这种展示图片方式和下一种方式等效
          Image(
            image: AssetImage('images/pexels-sofamuzaqi.jpg'),
            width: 90,
            height: 80,
          ),
          // 推荐使用它
          Image.asset(
            "images/pexels-sofamuzaqi.jpg",
          ),

          // 加载一张网络图片
          Image.network(
            'http://t.infuq.com/img/sample.jpg',
            height: 100,
            repeat: ImageRepeat.repeatX, // 横向重复
            width: MediaQuery.of(context).size.width, // MediaQuery.of(context).size 获取到的是上层容器的宽高
          ),

          // 通过设置混合模式,可以看到图片展示的样式已经修改
          Image.asset(
            "images/pexels-sofamuzaqi.jpg",
            width: 80,
            height: 80,
            color: Colors.green,
            colorBlendMode: BlendMode.colorDodge,
          ),

          Icon(
            Icons.android,
            size: 40,
            color: Theme.of(context).primaryColorDark,
          ),

          RaisedButton(
            child: Text('Raised Enable'),
            onPressed: () {
              print('This is a Raised Button can be clicked');
            },
          ),
          RaisedButton(
            child: Text('Raised Disable'),
            onPressed: null,
          ),

          FlatButton(
            child: Text('Flat Enable'),
            onPressed: () {
              print('This is a Flat Button can be clicked');
            },
            color: Colors.green,
          ),

          FlatButton(
            child: Text('Flat Disable'),
            onPressed: null,
            color: Colors.green,
          ),

          IconButton(
            icon: Icon(Icons.android),
            onPressed: () => print('This is a IconButton can be clicked'),
            color: Colors.green,
          ),
          IconButton(
            icon: Icon(Icons.android),
            onPressed: null,
          ),

          MaterialButton(
            child: Text('MaterialButton Enable'),
            onPressed: () => print('This is a MaterialButton can be clicked'),
            color: Colors.green,
          ),
          MaterialButton(
            child: Text('MaterialButton Disable'),
            onPressed: null,
          ),

          OutlineButton(
            child: Text('OutlineButton Enable'),
            onPressed: () => print('This is a OutlineButton can be clicked'),
            color: Colors.green,
          ),
          OutlineButton(
            child: Text('OutlineButton Disable'),
            onPressed: null,
          ),

        ],
      ),
    );
  }

}