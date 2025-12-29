
void main(List<String> args) {
  Future f = Future(() {
    return "hello world";
  });

  f.then((value){
    return Future(() => "task1 completed");
  }).then((value){
    return Future(() => "$value - task2 completed");
  }).then((value){
    return Future(() => "$value - task3 completed");
  }).then((value){
    print(value);
    throw Exception("故意抛出一个异常");
  }).catchError((error){
    print("出现问题");
    print(error);
  });


}