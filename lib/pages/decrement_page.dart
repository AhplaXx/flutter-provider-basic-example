import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_1/providers/counter_provider.dart';



class DecrementPage extends StatefulWidget {
  const DecrementPage({super.key});

  @override
  State<DecrementPage> createState() => _DecrementPageState();
}

class _DecrementPageState extends State<DecrementPage> {
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
              Consumer(builder: (context,counter,child){
                return Text("Your Data:",style: TextStyle(color: Colors.white,fontSize: 32),);

              }),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Consumer<Counter>(builder: (context,counter,child){
                    return  Text("${counter.data}",style: TextStyle(fontSize: 32,color: Colors.white),);
                  }),

                  IconButton(onPressed: ()=>Provider.of<Counter>(context,listen: false).decrement(), icon: Icon(Icons.exposure_minus_1,color: Colors.white))

                ],
              ),

              SizedBox(height: 10,),
              ElevatedButton(onPressed: ()=>Navigator.pop(context), child: Text("Previous Page"),style: ButtonStyle(
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
