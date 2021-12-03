class Food{
  final String displayName;
  final String imageUrl;

  Food({required this.displayName,required this.imageUrl});
  factory Food.fromJson(Map<String, dynamic> json){
    return Food(
        displayName: json['feed']['display']['displayName'],
        imageUrl: json['images']);
  }

}