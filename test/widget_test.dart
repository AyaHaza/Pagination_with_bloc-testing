import 'package:flutter_test/flutter_test.dart';
import 'funTexsting.dart';

void main(){
String url='https://www.u.com/{name}/{name}/{age}/{_}/{job}';
Map<String, dynamic> mapForTest = {"name":"israa","_":['kk','lk'],"age":11};


  test(" TestingUrl", () {
    expect(testUrl(url,mapForTest), "true");
  });
}
