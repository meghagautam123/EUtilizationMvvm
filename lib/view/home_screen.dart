import 'package:flutter/material.dart';
import 'package:flutter_mvvm_archit/utils/utils.dart';
import 'package:flutter_mvvm_archit/view_model/home_view_model.dart';
import 'package:provider/provider.dart';
import '../data/response/status.dart';


class HomeScreen extends StatefulWidget
{
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
  {
  //HomeViewModel homeViewModel = HomeViewModel();

  @override
  void initState() {
    //TODO: implement initState
      super.initState();
      print("calling init home screen");

      Future.delayed(Duration.zero).then((value)
      {
      Provider.of<HomeViewModel>(context, listen: false).fetchMoviewsList();
      });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,

        /*actions: [
          InkWell(
              onTap: (){
                userPrefernece.remove().then((value){
                  Navigator.pushNamed(context, RoutesName.login);
                });
              },
              child: Center(child: Text('Logout'))),
          SizedBox(width: 20,)
        ],*/
      ),

      body: /*ChangeNotifierProvider<HomeViewModel>(
        create: (BuildContext context) => homeViewModel,
        child:*/
          Consumer<HomeViewModel>(builder: (context, value, _) {

        switch (value.moviesList.status)
        {

          case Status.LOADING:
            Center(child: CircularProgressIndicator());

            print("loading");
             break;

          case Status.ERROR:
            Center(child: Text(value.moviesList.message.toString()));
            print("error");

            break;

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
  //  Text(Utils.averageRating(value.moviesList.data!.movies![index].ratings!).toStringAsFixed(1)),
    Icon(Icons.star , color: Colors.yellow,)
    ],
    ),
    ),
    );
    });*/
            //default:
            print("hello completed" +
                value.moviesList.data!.movies![0].title.toString());
            return Text(value.moviesList.data!.movies![0].title.toString());


            default:
            Text("Default Text");
        }

        return Text("hellohomescreen");
      }),
      // ) ,
    );
  }
}
