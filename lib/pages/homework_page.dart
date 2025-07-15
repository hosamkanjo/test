import 'package:flutter/material.dart';
import 'package:rest_api_session_2/services/product_service.dart';

class HomeworkPage extends StatefulWidget {
  const HomeworkPage({super.key});

  @override
  State<HomeworkPage> createState() => _HomeworkPageState();
}

class _HomeworkPageState extends State<HomeworkPage> {
  List<dynamic> result = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          result = await getAllProductsWithHttp();
          setState(() {});
        },
      ),
      body: result.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: result.length,
              itemBuilder: (context, index) {
                return ListTile(
            
                 
                  title: Text(result[index]['title']),
                  subtitle: Column(
                    children: [
                      Text(result[index]['description']),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            ...List.generate(
                              result[index]['images'].length,
                              (ind) => SizedBox(
                                width: 100,
                                height: 100,
                                child: Image.network(
                                  result[index]['images'][ind],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  leading: Image.network(result[index]['thumbnail']),
                  trailing: Text(result[index]['price'].toString()),
                );
              },
            ),
    );
  }
}
