import 'package:flutter/material.dart';
import 'package:foodapp2/feature/meals/presentation/meal/recom_meal.dart';
import '/core/color_constant.dart';
import '/pages/home/header.dart';
import '/feature/meals/services/api_service.dart';
import '/feature/meals/model/meal_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.username});
  final String username;
  @override
  State<HomePage> createState() => _HomePageState(username: username);
}

class _HomePageState extends State<HomePage> {
  final String username;
  List<MealModel> dataMeal = [];
  int mealCount = 0;
  late ApiService apiService;

  _HomePageState({required this.username});

  Future initialize() async {
    dataMeal = await apiService.getMeals();
    setState(() {
      mealCount = dataMeal.length;
      dataMeal = dataMeal;
    });
  }

  @override
  void initState() {
    apiService = ApiService();
    initialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primary,
      appBar: AppBar(
        backgroundColor: primary,
      ),
      body: SingleChildScrollView(
        controller: ScrollController(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Halo $username!",
                        style: const TextStyle(
                            color: black,
                            fontWeight: FontWeight.w500,
                            fontSize: 20),
                      ),
                      const Text(
                        "Ayo Makan!",
                        style: TextStyle(
                            color: black,
                            fontWeight: FontWeight.w500,
                            fontSize: 20),
                      ),
                    ],
                  ),
                  Container(
                    height: 200,
                    width: 200,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/logo.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  )
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Text(
                "Recommended for you",
                style: TextStyle(
                  color: black,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Header(
              dataMeal: dataMeal,
            ),
            SizedBox(
              height: 500,
              child: RecomMeal(
                dataMeal: dataMeal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
