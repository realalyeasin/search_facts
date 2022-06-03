import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:joke_api/Repository/fact_repository.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);
  TextEditingController textEditingController = TextEditingController();
  Repo repo = Repo();
  @override
  Widget build(BuildContext context) {
    return Obx(()=> Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text("Facts"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white),
                        child: TextFormField(
                          controller: textEditingController,
                          onChanged: (value) {
                            repo.getFact(value);
                          },
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  repo.getFact(textEditingController.text);
                                },
                                icon: Icon(Icons.search),
                              ),
                              hintText: 'How many facts you want to know ?'),
                        ),
                      )),
                  SizedBox(width: 10,),
                  Container(color: Colors.white,child: Center(child: IconButton(
                    onPressed: (){
                      textEditingController.clear();
                      repo.FactRepo.clear();
                    }, icon: Icon(Icons.clear,color: Colors.red,),
                  ),),)
                ],
              ),
              SizedBox(height: 600,
                child: ListView.builder(
                    itemCount: repo.factModels.length,
                    itemBuilder: (BuildContext, index){
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(repo.factModels[index].fact, style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),),
                      );
                    }),)
            ],
          ),
        ),
      ),
    ));
  }
}
