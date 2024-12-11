import 'package:flutter/material.dart';
import '/core/color_constant.dart';
import '/feature/meals/model/meal_model.dart';
import '/feature/meals/presentation/details/detail_page.dart';

class ListMeals extends StatefulWidget {
  final List listData;
  const ListMeals({super.key, required this.listData});

  @override
  State<ListMeals> createState() => _ListMealsState();
}

class _ListMealsState extends State<ListMeals> {
  bool isLoading = true;

  @override
  void initState() {
    super.initState();

    // Simulasi delay loading (misalnya data sedang dimuat)
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
            ),
          )
        : ListView.builder(
            itemCount: widget.listData.length,
            itemBuilder: (context, index) {
              final MealModel dataMeal = widget.listData[index];
              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailPage(
                        mealModel: dataMeal,
                      ),
                    ),
                  );
                },
                child: ListTile(
                  contentPadding: const EdgeInsets.all(8),
                  leading: Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      image: DecorationImage(
                        image: NetworkImage(dataMeal.gambar),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  title: Text(
                    dataMeal.title,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: black),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  subtitle: Text(
                    dataMeal.category,
                    style: const TextStyle(color: Colors.grey),
                  ),
                  trailing: const Icon(Icons.arrow_forward_ios),
                ),
              );
            },
          );
  }
}
