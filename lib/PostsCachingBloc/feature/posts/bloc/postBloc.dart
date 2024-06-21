import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/model/handling.dart';
import '../../../core/config/hive_config.dart';
import '../../../core/service/servicePost.dart';
import 'postEvents.dart';
import 'postStates.dart';

class PostsBloc extends Bloc<PostEvents,PostStates>{
  int page=1;
  ScrollController scrollController=ScrollController();
  PostsBloc():super (IntitalStatePost(null)) {
    scrollController.addListener(() {add(GetMorePostsEvent());});

   on<GetPostsEvent>((event, emit) async{
     emit(LoadingToGetPost(null));
     var posts=await PostsImp().getPosts(page);
     if( posts is ListOf<dynamic>){
       emit(GetAllPostState(postsAll: posts.data));
     }else{
       emit(ErrorToGetPost(null));
     }
   } );

  on<GetMorePostsEvent>((event, emit)async{
    if(scrollController.position.pixels==scrollController.position.maxScrollExtent ){
      page++;
      print(page);
      var posts=await PostsImp().getPosts(page);
      if( posts is ListOf<dynamic>){
        if(connectivityResult!= ConnectivityResult.none || connectivityResult == ConnectivityResult.wifi || connectivityResult == ConnectivityResult.mobile) {
          emit(GetAllPostState(postsAll: [ ...state.postsAll,...posts.data]));
        }else{
          emit(GetAllPostState(postsAll:state.postsAll));
        }
      }else{
        emit(ErrorToGetPost(null));
      }
    }
  },);
  }

  }


