import 'package:flutter/material.dart';
import 'package:hackthoneventproject/models/event.dart';

class CategoryBar extends StatefulWidget {
  const CategoryBar({Key? key, required this.events}) : super(key: key);
final List<Event> events;
  @override
  _CategoryBarState createState() => _CategoryBarState();
}

class _CategoryBarState extends State<CategoryBar> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
        itemCount: widget.events.length,
        itemBuilder:(context,index){
          return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              color: Colors.pinkAccent.shade100,
              child: Row(
                children: [
                  Container(
                   // height: 150,

                    child: Card(
                      clipBehavior: Clip.antiAlias,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Image.asset(widget.events[index].imageUrl,
                        fit: BoxFit.cover,
                        isAntiAlias: true,
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment
                        .spaceBetween,
                    children: [
                      Container(
                        child: Text(
                          widget.events[index].name
                          , style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          overflow: TextOverflow.clip,
                        ),
                        ),
                      ),
                      const SizedBox(height: 5,),

                      Container(
                        //width: 100,
                        child:  Text(
                          widget.events[index].date,
                          style:
                          const TextStyle(
                            fontSize: 12,
                          ),
                          overflow: TextOverflow.clip,),
                      )
                    ],
                  ),
                  IconButton(
                    icon: const Icon(Icons.arrow_forward_ios),
                    iconSize: 15,
                    color: Colors.grey.shade50,
                    onPressed: (){
                    //  Navigator.push( context,MaterialPageRoute(
                      //  builder:(context)=>
                   // ));
              }
                    ,),
                ],

              )
          );
        }

    );
  }
}
