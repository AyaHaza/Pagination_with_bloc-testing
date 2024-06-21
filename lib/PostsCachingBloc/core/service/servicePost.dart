import 'package:connectivity_plus/connectivity_plus.dart';
import '../config/constant.dart';
import '../config/hive_config.dart';
import '../model/ModelPosts.dart';
import '../model/handling.dart';
import 'coreService.dart';

abstract class PostsService extends CoreService{
  String basUrl='https://jsonplaceholder.typicode.com/posts';

  Future<ResultModel> getPosts(int page);
}

List<dynamic>posts=[];
List<dynamic> postsPutInHive=[];
List<dynamic> postsTakeFromHive=[];

class PostsImp extends PostsService{

@override
  Future<ResultModel> getPosts(page)async{

  try{
        if(connectivityResult!= ConnectivityResult.none || connectivityResult == ConnectivityResult.wifi || connectivityResult == ConnectivityResult.mobile){
        print("from server");
        CoreService.response=await CoreService.dio.get("$basUrl?_page=${page}&_limit=${Constant.limit}");
        print(CoreService.response.statusCode);
        if(CoreService.response.statusCode==200) {
          posts = List.generate(CoreService.response.data.length, (index) => Posts.fromJson(CoreService.response.data[index]));
          postsPutInHive.addAll(posts);
          postsHive!.delete("Allposts");
          postsHive!.put("Allposts", postsPutInHive);
          print("put in your cache "+"${postsHive!.get("Allposts").length} posts");
          return ListOf(data: posts);
        }else {
          return ErrorModel(message: 'The Status code is not 200');
        }
      }else{
        print("from cache");
        print("take from your cache "+"${postsHive!.get("Allposts").length} posts");
        postsTakeFromHive=postsHive!.get("Allposts");
        if(postsTakeFromHive.length != 0){
           return ListOf(data:postsTakeFromHive);
        }else{
            return ExceptionModel(message: 'There is no posts in your cache');
        }
      }
    }catch(e){
      print(e);
      return ExceptionModel(message: e.toString());
    }
  }
}


