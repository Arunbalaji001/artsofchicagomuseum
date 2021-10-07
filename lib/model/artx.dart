class artx {
  final int? id;
  final String? title;
  final String? artist_display;
  final String? place_of_origin;
  final String? imageurl;
  final String? imageurlhigh;
  final String? fiscal_year;
  final String? department_title;
  final String? artist_title;


  artx({this.id, this.title, this.artist_display, this.place_of_origin, this.imageurl,this.imageurlhigh,this.fiscal_year,this.artist_title,this.department_title});

  factory artx.fromJson(Map<String, dynamic> json) {
    return artx(
      id: json['id'],
      artist_display: json['artist_display'] ?? "Unknown",
      place_of_origin: json['place_of_origin'] ?? "Unknown",
      imageurl: json['image_id']!=null?'https://www.artic.edu/iiif/2/'+json['image_id']+'/full/400,/0/default.jpg'
          :'http://www.macedonrangeshalls.com.au/wp-content/uploads/2017/10/image-not-found.png',
      artist_title: json['artist_title']??'Unknown',
      department_title: json['department_title']??'Unknown',

      fiscal_year: (json['fiscal_year']??'Unknown').toString(),
      title:json['title']??'Unknown',
      imageurlhigh: json['image_id']!=null?'https://www.artic.edu/iiif/2/'+json['image_id']+'/full/843,/0/default.jpg'
          :'http://www.macedonrangeshalls.com.au/wp-content/uploads/2017/10/image-not-found.png',
    );
  }
}