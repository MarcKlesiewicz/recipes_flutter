import 'package:flutter/material.dart';
import 'recipe.dart';
import 'recipe_detail.dart';

//1
void main() {
  runApp(const RecipeApp());
}

//2
class RecipeApp extends StatelessWidget {
  const RecipeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = ThemeData();
    //3
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Recipe Caluculator',
      theme: theme.copyWith(
        colorScheme: theme.colorScheme.copyWith(
          primary: Colors.blue,
          secondary: Colors.black,
        ),
      ),
      home: const HomePage(title: 'Recipe Calculator'),
    );
  }
}

//4
class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key? key, required this.title}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    //5
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      //6
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SafeArea(
          //7
          child: ListView.builder(
              itemCount: Recipe.samples.length,
              itemBuilder: (BuildContext context, int index) {
                //8
                return GestureDetector(
                  child: recipeCard(Recipe.samples[index]),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return RecipeDetail(recipe: Recipe.samples[index]);
                        },
                      ),
                    );
                  },
                );
              }),
        ),
      ),
    );
  }

  Widget recipeCard(Recipe recipe) {
    //10
    return Card(
      elevation: 2.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        //11
        child: Column(
          children: <Widget>[
            Image(image: AssetImage(recipe.imageUrl)),
            const SizedBox(
              height: 14.0,
            ),
            //12
            Text(
              recipe.label,
              style: const TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w700,
                fontFamily: 'Palatino',
              ),
            )
          ],
        ),
      ),
    );
  }
}
