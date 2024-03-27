class CategoryEntity{
  String categoryId;
  String name;
  int totalExpense;
  String icon;
  String color;

  CategoryEntity({required this.categoryId, required this.name, required this.totalExpense, required this.icon, required this.color});

  Map<String ,Object?> toDocument(){
    return {
      "categoryId" : categoryId,
      "name" : name,
      "totalExpense" : totalExpense,
      "icon" : icon,
      "color" : color
    };
  }

  static CategoryEntity fromDocument(Map<String, dynamic> document){
    return CategoryEntity(
      categoryId: document['categoryId'],
      name: document['name'] ,
      totalExpense: document['totalExpense'],
      icon: document['icon'],
      color: document['color']
    );
  }


}