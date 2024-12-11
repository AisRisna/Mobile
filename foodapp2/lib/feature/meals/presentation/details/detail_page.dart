import 'package:flutter/material.dart';
import '/core/color_constant.dart';
import '/feature/meals/model/meal_model.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({
    super.key,
    required this.mealModel,
  });
  final MealModel mealModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primary,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          mealModel.title,
          style: const TextStyle(
              color: black, fontWeight: FontWeight.w500, fontSize: 16),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_rounded,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Gambar dengan bayangan
              Container(
                margin: const EdgeInsets.symmetric(vertical: 15),
                height: MediaQuery.of(context).size.height / 2.5,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(15)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      offset: const Offset(0, 4),
                      blurRadius: 6,
                    )
                  ],
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(mealModel.gambar),
                  ),
                ),
              ),

              // Kategori
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Icon(Icons.category, color: black, size: 20),
                  const SizedBox(width: 8),
                  Text(
                    mealModel.category,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),

              // Divider untuk pemisah
              Divider(color: black.withOpacity(0.3)),

              // Instructions Title
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  "Instructions",
                  style: TextStyle(
                    fontSize: 18,
                    color: black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              // Deskripsi / Keterangan
              Text(
                mealModel.keterangan,
                textAlign: TextAlign.justify,
                style: const TextStyle(
                  fontSize: 16,
                  color: black,
                  height: 1.5,
                ),
              ),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
