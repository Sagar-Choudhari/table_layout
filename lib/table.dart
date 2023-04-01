import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';

class TableOne extends StatelessWidget {
  const TableOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Table Layout',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const TableLayout(),
    );
  }
}

class TableLayout extends StatefulWidget {
  const TableLayout({Key? key}) : super(key: key);

  @override
  State<TableLayout> createState() => _TableLayoutState();
}

class _TableLayoutState extends State<TableLayout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Table"),
          centerTitle: true,
        ),
        body: Column(
          children: [
            const SizedBox(height: 15),
            Expanded(
              child: DataTable2(
                  columnSpacing: 12,
                  horizontalMargin: 12,
                  minWidth: 600,
                  border: TableBorder.all(),
                  columns: const [
                    DataColumn2(
                      label: Text('Column A'),
                      size: ColumnSize.L,
                    ),
                    DataColumn(
                      label: Text('Column B'),
                    ),
                    DataColumn(
                      label: Text('Column C'),
                    ),
                    DataColumn(
                      label: Text('Column D'),
                    ),
                    DataColumn(
                      label: Text('Column NUMBERS'),
                      numeric: true,
                    ),
                  ],
                  rows: List<DataRow>.generate(
                      100,
                      (index) => DataRow(cells: [
                            DataCell(Text('A' * (10 - index % 10))),
                            DataCell(Text('B' * (10 - (index + 5) % 10))),
                            DataCell(Text('C' * (15 - (index + 5) % 10))),
                            DataCell(Text('D' * (15 - (index + 10) % 10))),
                            DataCell(Text(((index + 0.1) * 25.4).toString()))
                          ]))),
            )
          ],
        ));
  }
}
