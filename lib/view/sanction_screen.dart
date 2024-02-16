import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mvvm_archit/model/sanction_model.dart';
import 'package:flutter_mvvm_archit/view_model/sanction_view_model.dart';
import 'package:provider/provider.dart';
import '../data/response/status.dart';

/*User
I am getting List<Map<String,dynamic>> from api now I want to show data in drop down in mvvm in
provider in flutter*/

class SanctionScreen extends StatefulWidget {
  const SanctionScreen({super.key});

  @override
  State<SanctionScreen> createState() => _SanctionScreenState();
}

class _SanctionScreenState extends State<SanctionScreen> {
  final ScrollController _scrollcontroller = ScrollController();
  String? newText;
  Map<String, dynamic>? selectedDropdownItem;
  String? selectedValue;
  FocusNode _focusNode = FocusNode();
  bool displayMonthList = false;
  TextEditingController textEditingController = new TextEditingController();
  String? dropdownvalue;
  List<String> monthList = ["By Sanction", "By Date", "By Scheme"];
  bool _isSanctionShow = false;

  @override
  void initState() {
    //TODO:implement initState
    super.initState();
    print("calling init sanction screen");

    textEditingController.addListener(_onTextChanged);

    Future.delayed(Duration.zero).then((value) {
      Map<String, dynamic> data = {
        'SchemeCode': '0821',
        'FinancialYear': '2023-2024'
      };
      print(data);
      final String jsonBody = jsonEncode(data);
      print("jsonbodysanctionscreen" + jsonBody);
      Provider.of<SanctionViewModel>(context, listen: false)
          .fetchSanctionList(jsonBody);
    });
    print("build method ends");
  }

  void _onTextChanged() {
    newText = textEditingController.text;
    print('Text changed: $newText');
    //Perform actions based on text changes here

    if (newText == "By Sanction") {
      setState(() {
        _isSanctionShow = true;
        //_isDate = false;
        //_isScheme = false;
        //_isAmount = false;
      });
    }
    /*else if (newText == "By Scheme") {
       setState(() {
         _isSanctionShow = false;
         _isScheme = true;
         _isDate = false;
         btnSearch = false;
         _isAmount = false;
       });
     } else if (newText == "By Date") {
       setState(() {
         _isSanctionShow = false;
         _isScheme = false;
         _isAmount = false;
         _isDate = true;
         //btnSearch=true;
         dateShow();
       });
     }*/
  }

  void textChanged(String value) {
    print('Text changed: $value');
    //You can perform any actions or checks here based on the value
  }

  void _onTextClicked() {
    setState(() {
      displayMonthList = !displayMonthList;
    });
    _focusNode.unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          /*actions:[
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
        body:
            /*ChangeNotifierProvider<HomeViewModel>(
        create: (BuildContext context) => homeViewModel,
        child:*/

            /*Consumer<SanctionViewModel>(builder: (context, value, _)
      {

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


            List<Map<String, dynamic>>? data = value.moviesList.data;
            print("dropdowndatalist1"+data!.length.toString());
            List<SanctionModel> _data = data!.map((item) => SanctionModel(
            schemeCode :item['SchemeCode'],
                stateCode : item['StateCode'],
          agencyUniqueCode : item['AgencyUniqueCode'],
          financialYear : item['FinancialYear'],
          sanctionNo : item['SanctionNo'],
          transactionId : item['TransactionId'],
          sanctionDate : item['SanctionDate'],
          sanctionAmount : item['SanctionAmount'],
          controllerName : item['ControllerName'],
          grantNo : item['GrantNo'],
          functionHead : item['FunctionHead'],
          objectHead : item['ObjectHead'],
          aPIResponseStatus : item['APIResponseStatus']
            )).toList();
         print("dropdowndatalist65"+_data[0].sanctionAmount.toString());

            return

             //Text(value.moviesList.data.toString());
             //List<YourModel> data = viewModel.data;

         DropdownButtonFormField<String>
           (
        value:_data[0].sanctionAmount.toString() , // Set the default value or null
        items: _data.map((item) {
        return DropdownMenuItem<String>(
        value: item.sanctionAmount.toString(),
        child: Text(item.sanctionAmount.toString()),
        );
        }).toList(),

        onChanged: (selectedValue)
        {
        //Handle the selected value

          setState(()
          {
          selectedValue=   selectedValue;
          print("selecteddropdown"+selectedValue!);
         });

        },

         );

          default:
            Text("Default Text");
        }

        return Text("hellohomescreen");
      }),*/

            Container(
                padding: EdgeInsets.all(10.0),
                child: Column(
                    //mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 30,
                      ),

                      Center(
                          child: Container(
                        width: 230,
                        height: 40,
                        padding: EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.0),
                          border: Border.all(
                              color: Colors.red.withOpacity(0.8),
                              style: BorderStyle.solid,
                              width: 2.00),
                        ),

                            child: TextField(
                            enableInteractiveSelection: false,
                            //textAlign: TextAlign.,
                            textAlignVertical: TextAlignVertical.center,
                            focusNode: _focusNode,
                            onTap: _onTextClicked,
                            controller: textEditingController,
                            onChanged: (_value) {
                              setState(() {
                                print("texteditval345678" + _value);

                                dropdownvalue = _value!;
                              });
                              textChanged(_value);
                            },
                            decoration: InputDecoration(
                                hintText: "Search By Category",
                                contentPadding:
                                    EdgeInsets.symmetric(vertical: 9.0),
                                hintStyle: TextStyle(
                                  fontSize: 15.0,
                                  color: Colors.black,
                                ),
                                border: InputBorder.none,
                                suffixIcon: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      displayMonthList = !displayMonthList;
                                    });
                                  },
                                  child: Icon(Icons.arrow_drop_down,
                                      color: Colors.black),
                                ))),
                      )),

                      displayMonthList
                          ? Center(
                              child: Container(
                                width: 230,
                                height: 130,
                                decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey.withOpacity(0.3),
                                          spreadRadius: 1,
                                          blurRadius: 3)
                                    ],
                                    borderRadius: BorderRadius.circular(6),
                                    color: Colors.white),

                                //child:
                                /*GestureDetector(
                          onTap: ()
                          {
                          print("tapped outside");
                          },
                       child:*/
                                /*Scrollbar(
                            controller: _scrollcontroller,
                            thumbVisibility:true,
                        */

                                child: GestureDetector(
                                  onTap: () {
                                    print("tapped outside");
                                    Navigator.pop(context);
                                  },

                                  child: ListView.separated(
                                    controller: _scrollcontroller,
                                    itemCount: monthList.length,
                                    padding: EdgeInsets.zero,
                                    itemBuilder: (context, index) {
                                      return GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            textEditingController.text =
                                                (monthList[index]).toString();
                                            displayMonthList =
                                                !displayMonthList;
                                          });
                                        },
                                        child: ListTile(
                                            title: Text(monthList[index])),
                                      );
                                    },
                                    separatorBuilder:
                                        (BuildContext context, int index) =>
                                            Divider(
                                      height: 0.0,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  //  ),
                                ),
                                // ),
                              ),
                            )

                          : SizedBox(),

                      //Load Sanction Data From Get Sanction Api

                      Visibility(
                        visible: _isSanctionShow,
                        child: Padding(
                          padding:
                              const EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
                          child: Center(
                            child: Container(
                                width: 230,
                                height: 40,
                                padding: EdgeInsets.all(5.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30.0),
                                  border: Border.all(
                                      color: Colors.red.withOpacity(0.8),
                                      style: BorderStyle.solid,
                                      width: 2.00),
                                ),

                                child: Consumer<SanctionViewModel>(
                                    builder: (context, value, _) {

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

                          if (!value.isInternetConnected)
                          {
                            //Show a message when there is no internet connection
                            return Center(
                              child: Text('No internet connection'),
                            );
                          }

                          else
                          {

                            List<Map<String, dynamic>>? data = value.moviesList.data;
                            print("dropdowndatalist1"+data!.length.toString());

                            List<SanctionModel> _data = data!.map((item) =>
                                SanctionModel(
                                    schemeCode :item['SchemeCode'],
                                    stateCode : item['StateCode'],
                                    agencyUniqueCode : item['AgencyUniqueCode'],
                                    financialYear : item['FinancialYear'],
                                    sanctionNo : item['SanctionNo'],
                                    transactionId : item['TransactionId'],
                                    sanctionDate : item['SanctionDate'],
                                    sanctionAmount : item['SanctionAmount'],
                                    controllerName : item['ControllerName'],
                                    grantNo : item['GrantNo'],
                                    functionHead : item['FunctionHead'],
                                    objectHead : item['ObjectHead'],
                                    aPIResponseStatus : item['APIResponseStatus']
                                )).toList();

                            print("dropdowndatalist65"+_data[0].sanctionAmount.toString());

                            return
                              DropdownButtonHideUnderline(
                                child: DropdownButton<String>
                                  (
                                  hint: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          8.0, 0.0, 0.0, 0.0),
                                      child: Text(
                                        'Select Sanction',
                                        style: TextStyle(
                                            fontSize: 14,
                                            // color: Theme.of(context).hintColor,
                                            color: Colors.black87),
                                      )),

                                  //Set the default value or null

                                  items: _data.map((item) {
                                    return DropdownMenuItem<String>(
                                      value: item.sanctionAmount.toString(),
                                      child: Text(item.sanctionAmount.toString()),
                                    );
                                  }).toList(),

                                  onChanged: (selectedVal)
                                  {
                                    //Handle the selected value
                                    setState(()
                                    {
                                      selectedValue = selectedVal;
                                      print("selecteddropdown"+selectedValue!);
                                    });
                                  },
                                  value: selectedValue ,
                                ),
                              );
                          }

                        default:
                          Text("Default Text");
                      }

                                  if (!value.isInternetConnected)
                                  {
                                    print("no internet connection");
                                    //Show a message when there is no internet connection

                                    return Center(
                                      child: Text('No internet connection'),
                                    );
                                  }
                                  else
                                  {
                                    return Text("hkjhkj");
                                    print("internet connection");
                                  }
                                  //}

                                  /* throw(Exception e)
                      {
                        print("no connect");
                      };
*/

                                  //return Text("hellohomescreen");
                                })),
                          ),
                        ),
                      )
                    ])));
  }
}
