import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/counter_provider.dart';
import 'decrement_page.dart';


class IncrementPage extends StatefulWidget {
  const IncrementPage({super.key});

  @override
  State<IncrementPage> createState() => _IncrementPageState();
}

class _IncrementPageState extends State<IncrementPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: Padding(
        padding: EdgeInsets.all(12),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              Text("Your Data:",style: TextStyle(color: Colors.white,fontSize: 32),),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Consumer<Counter>(builder:(context,counter,child){
                    return Text("${counter.data}",style: TextStyle(fontSize: 32,color: Colors.white),);


                  }),
                  IconButton(onPressed: ()=>Provider.of<Counter>(context,listen: false).increment(), icon: Icon(Icons.add,color: Colors.white))

                ],
              ),

              SizedBox(height: 10,),
              ElevatedButton(onPressed: ()=>
                 Navigator.push(context,MaterialPageRoute(builder: (context)=>DecrementPage()) ), child: Text("Next Page"),style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(Colors.white),
                foregroundColor: WidgetStatePropertyAll(Colors.black),
                shape: WidgetStatePropertyAll<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),

                  ),
                ),              ),),


            ],
          ),
        ),
      ),
    );
  }
}
