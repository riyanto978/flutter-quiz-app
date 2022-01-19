import 'package:flutter/material.dart';

Widget questionWidget({
  required String text,
  required Function() onTap,
  required bool? status,
}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(text),
              Text(status.toString()),
              if (status == null)
                Container()
              else
                Container(
                  width: 26,
                  height: 26,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(50),
                    color: status ? Colors.green : Colors.red,
                  ),
                  child: Icon(
                    status ? Icons.done : Icons.close,
                    color: Colors.white,
                  ),
                )
            ],
          ),
        ),
      ),
    ),
  );
}
