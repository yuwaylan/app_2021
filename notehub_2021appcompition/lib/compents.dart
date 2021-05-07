#import'package:flutter/material.dart';


class BabyData {
  final DocumentReference reference;
  String name;
  int dept;

  BabyData.data(this.reference,
      [this.name,
        this.dept]) {
    // Set these rather than using the default value because Firebase returns
    // null if the value is not specified.
    this.name ??= 'Frank';
    this.dept ??= 7;
  }

  factory BabyData.from(card_adap document) => BabyData.data(
      document.reference,
      document.data['name'],
      document.data['vote']);

  void save() {
    reference.setData(toMap());
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'vote': dept,
    };
  }
}

class card_adap {
   cardGen get reference => null;
  get data => null;
  cardGen('${refer}')
}

class DocumentReference {
  void setData(Map<String, dynamic> map) {}
}

class BabyCard extends StatefulWidget {
final BabyData baby;

BabyCard(this.baby);

@override
State<StatefulWidget> createState() {
     return MyAdaptCard(baby);
  }
}

class MyAdaptCard extends State<BabyCard> {
    BabyData Mycard_Cont;
    String renderUrl;

    MyAdaptCard(this.Mycard_Cont);

    Widget get babyCard {
        return
        new Card(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
            ListTile(
              leading: const Icon(Icons.album),
              title: Text( ${Mycard_Cont.name} ),
              subtitle: Text('${Mycard_Cont.dept} '),
          ),
          new ButtonTheme.bar( // make buttons use the appropriate styles for cards
            child: new ButtonBar(
              children: <Widget>[
                new FlatButton(
                  child: const Text('${vars.matrr} '),
                onPressed: () {Contant(); },
            ),
          new FlatButton(
          child: const Text('${vars.classid} '),
            onPressed: () {addContant();},
        )]))]));
    }
    @override
    Widget build(BuildContext context) {
       return new Container(
    child:  babyCard,
    );
    }
}