import 'package:flutter/material.dart';
import 'package:hackthoneventproject/api/controllers/csp_api_controller.dart';
import 'package:hackthoneventproject/models/category.dart';
import 'package:hackthoneventproject/models/event.dart';
import 'package:hackthoneventproject/widgets/category_avtive_end.dart';

class CategoryDetails extends StatefulWidget {
  const CategoryDetails({Key? key,required this.category}) : super(key: key);
final Category category;
  @override
  _CategoryDetailsState createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> with SingleTickerProviderStateMixin {

  late TabController _tabController;

  late Future<List<Event>> _future;
  List<Event> _events = <Event>[];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController( length:2,vsync: this);
    _future=CspApiController().getEvents(widget.category.id);

  }

  @override
  void dispose() {
    // TODO: implement dispose
    _tabController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: FutureBuilder<List<Event>>(
        future: _future,
        builder: (context,snapshot)
    {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return const Center(child: CircularProgressIndicator());
      }
      if (snapshot.hasData && snapshot.data!.isNotEmpty) {
        _events = snapshot.data ?? [];
       return ListView(
            children: [
              Container(
                //height: 200,
                child: Stack(
                  children: [
                    Container(
                      height: 150,
                      width: double.infinity,
                      color: Colors.blue,
                      child: Stack(
                        children: [
                          Row(
                            children: [
                              IconButton(
                                  onPressed:() =>Navigator.pop(context),
                                  icon: Icon(Icons.arrow_back)),
                              SizedBox(width: 100,),
                              Text('Events'),

                            ],
                          ) ,
                          Positioned(
                            top: 100,
                            left:300,
                            child: CircleAvatar(
                              radius: 50,
                              backgroundColor: Colors.white38,
                            ),
                          ),
                          Positioned(
                            top: 70,
                            right:280,
                            child: CircleAvatar(
                              radius: 70,
                              backgroundColor: Colors.white38,
                            ),
                          ),
                          Positioned(
                            bottom: 110,
                            left:250,
                            child: CircleAvatar(
                              radius: 40,
                              backgroundColor: Colors.white38,
                            ),
                          ),


                        ],
                      ),
                    ),
                    Positioned(
                      top: 100,
                      left:145,
                      child: CircleAvatar(
                        radius: 50,
                        backgroundColor: Colors.red,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10,),
              Center(child: Text(widget.category.nameEn)),
              SizedBox(height: 10,),
              Center(child: Text(widget.category.eventsCount.toString())),
              CategoryBar(events: _events,)



//   Stack(
//     children: [
//       Container(
//         height: 150,
//         width: double.infinity,
//         color: Colors.blue,
//       ),
//       Row(
//         children: [
//           IconButton(
//               onPressed:() =>Navigator.pop(context),
//               icon: Icon(Icons.arrow_back)),
//           SizedBox(width: 100,),
//           Text('Events'),
//
//         ],
//       ) ,
//     Positioned(
//       top: 100,
//       left:300,
//       child: CircleAvatar(
//         radius: 50,
//         backgroundColor: Colors.white38,
//       ),
//     ),
//       Positioned(
//         top: 70,
//         right:280,
//         child: CircleAvatar(
//           radius: 70,
//           backgroundColor: Colors.white38,
//         ),
//       ),
//       Positioned(
//         bottom: 110,
//         left:250,
//         child: CircleAvatar(
//           radius: 40,
//           backgroundColor: Colors.white38,
//         ),
//       ),
//
//     ],
//
//   )
// ],

//        TabBar(
//          indicatorColor: Colors.lightBlueAccent,
//          labelStyle: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),
//          controller: _tabController,
//          tabs: [
//            Tab(text: 'Questions & Answers',),
//          ],


//        ),



            ]);
      }

      else {
        return Center(
          child: Column(
            children: const [
              Icon(Icons.warning, size: 80),
              Text(
                'NO DATA',
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              )
            ],
          ),
        );
      }
    })
    );
  }
  Widget getTabBarView(){
    return TabBarView(


      children: [

      ],

      controller: _tabController,);
  }
}
