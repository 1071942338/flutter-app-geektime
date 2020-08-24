//价格信息
class Price {
  num market;//市场价
  num sale;//售价

  Price({this.market,this.sale});

  //JSON解析工厂类，使用字典数据为对象初始化赋值
  factory Price.fromJson(Map<String,dynamic> parseJson){
    return Price(
        market:parseJson["market"],
        sale:parseJson["sale"],
    );
  }
}

//作者信息
class Author{
  String name;
  String intro;
  String avatar;
  Author({this.name,this.intro,this.avatar});

  //JSON解析工厂类，使用字典数据为对象初始化赋值
  factory Author.fromJson(Map<String,dynamic> parseJson){
    return Author(
        name:parseJson["name"],
        intro:parseJson["intro"],
        avatar:parseJson["avatar"],
    );
  }
}

//产品信息
class Product {
  //成员变量
  num id;
  String title;
  String subtitle;
  String unit;
  Price price;
  Author author;

  //构造函数
  Product({this.id,this.title,this.subtitle,this.unit,this.price,this.author});

  //JSON解析工厂类，使用字典数据为对象初始化赋值
  factory Product.fromJson(Map<String,dynamic> parseJson){
    return Product(
        id:parseJson["id"],
        title:parseJson["title"],
        subtitle:parseJson["subtitle"],
        unit:parseJson["unit"],
        price:Price.fromJson(parseJson["price"]),
        author:Author.fromJson(parseJson["author"])
    );
  }
}