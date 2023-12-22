class Blog {
  late String color;
  late int id;
  late int year;
  late String pantone_value;
  late String name;

  Blog(this.id, this.name, this.color, this.year, this.pantone_value);

  Blog.fromJson(Map<String, dynamic> json) {
    id = json['id'];  
    color = json['color'];
    year = json['year'];
    pantone_value = json['pantone_value'];
    name = json['name'];
  }
}
