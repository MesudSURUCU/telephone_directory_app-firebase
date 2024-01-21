class Persons {
    String personId;
    // Silme ve güncelleme yapabilmek için değişken türünü String olarak ayarladık.
    String personName;
    String personNumber;

    Persons({required this.personId,required this.personName, required this.personNumber});


    factory Persons.fromJson(String key, Map<dynamic,dynamic> json) {

    return Persons(
      personId: key, 
      personName: json["kisi_ad"] as String, 
      personNumber: json["kisi_tel"] as String);

    }
}