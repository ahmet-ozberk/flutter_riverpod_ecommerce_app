import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grock/grock.dart';

import '../model/product_model.dart';

class ProductWidget extends StatelessWidget {
  ProductModel model;
  Function setFavorite;
  Function setBasket;
  ProductWidget(
      {required this.model,
      required this.setFavorite,
      required this.setBasket});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: 10.allBR,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: 10.allBR,
                child: Image.network(model.imagePath),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        model.title,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        model.description,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Center(
                        child: Text(
                          model.price.toString() + " ₺",
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      GrockContainer(
                        onTap: ()=>setBasket(),
                        padding: 3.verticalP,
                        decoration: BoxDecoration(
                          borderRadius: 10.allBR,
                          color: Colors.white,
                          border: Border.all(
                            color: Colors.blue,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(CupertinoIcons.bag_badge_plus),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "Ekle",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned.fill(
          child: Align(
            alignment: Alignment.topRight,
            child: GrockContainer(
              onTap: () => setFavorite(),
              padding: 3.allP,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                border: Border.all(color: Colors.grey.shade300, width: 0.5),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 8,
                  ),
                ],
              ),
              child: Icon(
                model.isFavorite
                    ? CupertinoIcons.heart_fill
                    : CupertinoIcons.heart,
                color: model.isFavorite ? Colors.red : Colors.black,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
