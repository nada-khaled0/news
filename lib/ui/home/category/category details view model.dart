// import 'package:flutter/material.dart';
// import 'package:news/api/api%20manager.dart';
// import 'package:news/model/SourceResponse.dart';
//
// class CategoryDetailsViewModel extends ChangeNotifier{
//   List<Source>? sourceList;
//   String? errorMessage;
//
//   void getSources(String categoryId)async{
//     sourceList= null;
//     errorMessage=null;
//     notifyListeners();
//   try{
//     var response= await ApiManager.getSource(categoryId);
//     if(response?.status=='error'){
//       errorMessage=response!.message!;
//     }else{
//       sourceList=response!.sources!;
//     }
//
//   }catch(e){
//     errorMessage=e.toString();
//   }
// notifyListeners();
//
//   }
//
// }
