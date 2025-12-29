void main(List<String> args) {
  Future f = Future(() {
    // return "hello world";

    return Exception("something went wrong");
  });

  f.then((value){
    print(value);
  });

  f.catchError((error){
    print(error);
  });
}