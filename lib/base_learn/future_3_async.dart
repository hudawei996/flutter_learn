
// ignore: dangling_library_doc_comments
/// Future-async+await
/// 
/// 函数名（） async {
///   try {
///    await Future();
///    //future 执行成功后才执行的逻辑
///   // ....
/// } catch(error) {
///   //future 执行失败后才执行的逻辑
///   // ....  
/// }
/// 
/// await总是等到后面的Future执行完成后，才会执行下面的逻辑
/// async必须配套await使用

void main(List<String> args) {
  test();
}

void test() async{
  try{
    await Future((){
      // return "hello world";
      print("执行成功之后的逻辑");

      //throw Exception("故意抛出一个异常");
    });

    await Future.delayed(Duration(seconds: 2), (){
      print("延时2秒之后的逻辑");
    });
  } catch(error){
    print(error);
  }
}