import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_mvvm_archit/view_model/auth_view_model.dart';
import 'package:provider/provider.dart';
import '../data/response/status.dart';


class LoginScreen extends StatefulWidget
{
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
 AuthViewModel homeViewModel = AuthViewModel();

 @override
  void initState()
 {
    //TODO: implement initState
    Map<String,String> data = {'username': 'nr1023', 'password': 'root@123'};
    final String jsonBody = jsonEncode(data);
    homeViewModel.loginApi(jsonBody,context);
    super.initState();
  }

  @override
  Widget build(BuildContext context)
  {
   // final authViewMode = Provider.of<AuthViewModel>(context);

    return Scaffold(
     //providers: [ChangeNotifierProvider(create: (_)=> AuthViewModel())]


      body: /*ChangeNotifierProvider<AuthViewModel>(
        create: (BuildContext context) => homeViewModel,
        child:*/ Consumer<AuthViewModel>(
            builder: (context, value, _)
            {

              switch(value.loginResponse.status)
              {

                case Status.LOADING:
                  Center(child: CircularProgressIndicator());

                  print("loading");
                  //break;

                case Status.ERROR:
                 // Center(child: Text(value.moviesList.message.toString()));
                  print("error");

                  //break;

                case Status.COMPLETED:

                /*ListView.builder(
    itemCount: value.moviesList.data!.movies!.length,
    itemBuilder: (context,index){
    return Card(
    child: ListTile(

    leading: Image.network(

    value.moviesList.data!.movies![index].posterurl.toString(),
    errorBuilder: (context, error, stack){
    return Icon(Icons.error, color: Colors.red,);
    },
    height: 40,
    width: 40,
    fit: BoxFit.cover,
    ),
    title: Text(value.moviesList.data!.movies![index].title.toString()),
    subtitle: Text(value.moviesList.data!.movies![index].year.toString()),
    trailing: Row(
    mainAxisSize: MainAxisSize.min,
    children: [
    //Text(Utils.averageRating(value.moviesList.data!.movies![index].ratings!).toStringAsFixed(1)),
    Icon(Icons.star , color: Colors.yellow,)
    ],
    ),
    ),
    );
    });*/
                //default:
                 // print("hello completed"+value.moviesList.data!.movies![0].title.toString());
                  return   Text(value.loginResponse.data!.status.toString());

                default:
                  Text("Default Text");

              }


              return Text("jgjj");
            }

        ),
     // ) ,



    );
  }
}
