import 'package:flutter/material.dart';
import 'package:hackthoneventproject/api/controllers/csp_api_controller.dart';
import 'package:hackthoneventproject/create_screen.dart';
import 'package:hackthoneventproject/category_details.dart';
import 'package:hackthoneventproject/models/category.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {


  late Future<List<Category>> _future;
  List<Category> _categories = <Category>[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _future=CspApiController().getCategories();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Categories'),
        actions: [
          IconButton(onPressed: (){

            Navigator.push(context, MaterialPageRoute(
                builder: (context)=> CreateScreen(categories:_categories)

         ));
            },
              icon: Icon(Icons.add),
          )
        ],
       ),
      body:  FutureBuilder<List<Category>>(
        future: _future,
        builder: (context,snapshot){
    if (snapshot.connectionState == ConnectionState.waiting) {
    return const Center(child: CircularProgressIndicator());
    }
    if (snapshot.hasData && snapshot.data!.isNotEmpty){
    _categories=snapshot.data??[];
    return GridView.builder(
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    childAspectRatio: 1,
    crossAxisCount: 2,
    ),
    itemCount: _categories.length,
    itemBuilder: (context,index){
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder:
            (context)=>CategoryDetails(category: _categories[index],)
        ));
      },
      child: Container(
      height:100 ,
      color: Colors.black12,
      child: Column(
      children: [
      SizedBox(height: 10,),
      Stack(
      children: [
      Container(

      height: 150,
      width:170,
      color: Colors.white,
      child: Card(
      color: Colors.red,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
      ),
   child: Image.network(_categories[index].image,
       fit: BoxFit.cover,
       isAntiAlias: true,
   ),
      ),
      ),
      Positioned(
      bottom: 10,
      left: 10,
      child: Container(
      color: Colors.white38,
      height: 20,
      child: Text('${_categories[index].eventsCount.toString()} Events')
      )

      )
      ],
      ),
      Text(_categories[index].nameEn)
      ],
      ),
      ),
    );

    });

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
    },
    ));
  }
}
