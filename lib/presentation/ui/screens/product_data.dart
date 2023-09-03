import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_app/main.dart';
import 'package:product_app/presentation/bloc/product_data_bloc/product_bloc.dart';
import 'package:product_app/presentation/bloc/product_data_bloc/product_state.dart';
import 'package:product_app/presentation/ui/screens/product_details.dart';


class ProductDataPAge extends StatefulWidget {
  const ProductDataPAge({super.key});

  @override
  State<ProductDataPAge> createState() => _ProductDataPAgeState();
}

class _ProductDataPAgeState extends State<ProductDataPAge> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Deliveroo",
              style: TextStyle(
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w500,
                  color: Colors.amber),
            ),
          ],
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.search,
                color: Colors.black,
              ))
        ],
      ),
      body: BlocProvider<ProductBloc>(
          create: (context) => ProductBloc(getIt())..loadedApi(),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
              padding: EdgeInsets.all(8),
              margin: EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Welcome... ',
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                          color: Colors.white)),
                  SizedBox(
                    height: 10,
                  ),
                  Text('Lets Explore!!!',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: Colors.white)),
                  SizedBox(
                    height: 13,
                  ),
                  BlocBuilder<ProductBloc, ProductState>(
                    builder: (context, state) {
                      if (state.isLoading) {
                        print('object');
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      if (state.isLoaded) {
                        final dataInfo = state as ProductState;

                        return GridView.builder(
                          itemCount: dataInfo.products!.length,
                          gridDelegate:
                              const SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 250,
                            mainAxisExtent: 280,
                            childAspectRatio: 0.6,
                            crossAxisSpacing: 8,
                            mainAxisSpacing: 8,
                          ),
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return SingleChildScrollView(
                              physics: NeverScrollableScrollPhysics(),
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => ProductDetail(
                                            productDataModel:
                                                dataInfo.products![index]),
                                      ));
                                },
                                child: Card(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                    elevation: 15,
                                    child: Container(
                                      padding: EdgeInsets.all(8),
                                      height: 250,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.amber, width: 5),
                                        borderRadius: BorderRadius.circular(30),
                                        color: Colors.white54,
                                      ),
                                      child: Column(
                                        children: [
                                          Container(
                                            padding: EdgeInsets.only(top: 14),
                                            height: 150,
                                            child: Image.network(
                                                dataInfo
                                                    .products![index].imageUrl,
                                                fit: BoxFit.cover),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text(dataInfo.products![index].name,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold)),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Container(
                                            padding: EdgeInsets.all(5),
                                            decoration: BoxDecoration(
                                                color: Colors.blueGrey,
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            child: Text(
                                              dataInfo.products![index].tagline,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ],
                                      ),

                                    
                                    )

                                
                                    ),
                              ),
                            );
                          },
                        );
                      
                      }
                      return SizedBox();
                    },
                  ),
                ],
              ),
            ),
          )),
      drawer: const Drawer(
        elevation: 10,
      ),
    );
  }
}
