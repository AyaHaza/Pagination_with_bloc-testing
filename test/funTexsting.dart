
import 'package:meta/meta.dart';

@visibleForTesting
String? testUrl(String nameUrl,Map<String, dynamic> map) {

  String scheme =r'^(\bhttps\b:\/\/)?$|^(\bhttp\b:\/\/)?$';
  String slash=r'^(:\/\/)?$';
  String domainName=r'^(w{3}\.\w{1,}\.\bcom\b)$';
  String path= r'^(\/\{*\b.{1,}\b\}*)*$';
  String url =r'^(\bhttps\b:\/\/)?(w{3}\.\w{1,}\.\bcom\b)(\/\{*\b.{1,}\b\}*)*$|^(\bhttp\b:\/\/)?(w{3}\.\w{1,}\.\bcom\b)(\/\{*\b.{1,}\b\}*)*$';
  List res=[];          //[{..},{..},....]
  List keyList=[];      //[.. , .. , ...]
  RegExp regExp = new RegExp(url);
  print(regExp.pattern);
  print("Your map : "+"${map}\n\n");
  String oldUrl='';
  oldUrl=nameUrl;

  if (regExp.hasMatch(nameUrl)) {

    //to set values to res list
     final pattern = RegExp(r'\{\b\w*\b\}');
     final matches = pattern.allMatches(nameUrl);
     for (final match in matches) {res.add(match.group(0));}

     //to set values to keyList list from res list
     for(final i in res){
       final patternn = RegExp(r'\b\w*\b');
       final matchess = patternn.allMatches(i);
       for (final match in matchess) {keyList.add(match.group(0));}
     }


    if (map.isEmpty) {
      print(nameUrl+"\nyour URL true but your map is empty \n-----> fill it and try again! <-----");
      return "true";
    } else {
      if(keyList.isNotEmpty && res.isNotEmpty){
        for( final key in keyList){
          for(final resl in res){
              nameUrl = nameUrl.replaceAll(resl, (map.containsKey(key)==keyList.contains(key)&&resl=="{$key}")?map[key].toString():resl);
          }
        }
        print("The old URL : "+oldUrl);
        print('your URL true and we replace the variables that have the same key in your map');
        print("The new URL : "+nameUrl);
        return 'true';
      }else{
        print("The old URL : "+oldUrl);
        print('your URL true but you don\'t have variables to replace them \n-----> So your URL remains the same <-----  ' );
        print("The new URL : "+nameUrl);
        return 'true';
      }
    }
  }else if (!regExp.hasMatch(nameUrl)) {
    print("Your URL : "+oldUrl);
    print('There is wrong in your URL \n-----> write well then try again! <-----');
    return 'true';
  }
  print('error');
  return "true";
}