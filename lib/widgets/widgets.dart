// ignore_for_file: unused_element

import 'package:flutter/material.dart';
import 'package:money_formatter/money_formatter.dart';
import 'package:venturo_livetest/models/menu.dart';

Widget buildMenuItemCard(
    MenuItem item, VoidCallback onAdd, VoidCallback onReduce, int counter) {
  MoneyFormatter fmf = MoneyFormatter(
      amount: item.harga.toDouble(),
      settings: MoneyFormatterSettings(
        thousandSeparator: '.',
        decimalSeparator: ',',
        symbolAndNumberSeparator: ' ',
        fractionDigits: 0,
      ));

  return Container(
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5), // Shadow color
              spreadRadius: 2, // Shadow spread radius
              blurRadius: 3, // Shadow blur radius
              offset: Offset(0, 3), // Shadow position
            ),
          ],
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Row(children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
              decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              width: 70,
              height: 70,
              child: Padding(
                padding: const EdgeInsets.only(left: 2, right: 2),
                child: Image.network(
                  item.gambar,
                  fit: BoxFit.contain,
                ),
              )),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              item.nama,
              style: TextStyle(fontSize: 18),
            ),
            Text(
              'Rp ${fmf.output.nonSymbol.toString()}',
              style: TextStyle(
                  color: Color.fromARGB(255, 0, 154, 173),
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
            ),
            Container(
              child: Row(
                children: [
                  Image.asset(
                      'assets/images/Vector_note.png'), // Replace this with your image widget
                  Text('Tambahkan Catatan'),
                ],
              ),
            ),
          ],
        ),
        Spacer(),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Material(
                child: InkWell(
                  onTap: onReduce,
                  child: SizedBox(
                      width: 30,
                      height: 30,
                      child: Image.asset('assets/images/Vector_min.png')),
                ),
              ),
            ),
            Text(
              counter.toString(),
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Material(
                child: InkWell(
                  onTap: onAdd,
                  child: SizedBox(
                      width: 30,
                      height: 30,
                      child: Image.asset('assets/images/Vector_plus.png')),
                ),
              ),
            ),
          ],
        ),
      ]));
}

/*
Widget buildMenu(List<MenuItem> items) {
  return ListView.builder(
    itemCount: items.length,
    itemBuilder: (context, index) {
      return Padding(
        padding: const EdgeInsets.only(top: 8, left: 25, right: 25, bottom: 8),
        child: buildMenuItemCard(items[index]),
      );
    },
  );
}
*/
