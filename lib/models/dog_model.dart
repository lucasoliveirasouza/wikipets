class DogModel {
  String? bredFor;
  String? breedGroup;
  Height? height;
  int? id;
  Image? image;
  String? lifeSpan;
  String? name;
  String? origin;
  String? referenceImageId;
  String? temperament;
  Height? weight;

  DogModel(
      {this.bredFor,
      this.breedGroup,
      this.height,
      this.id,
      this.image,
      this.lifeSpan,
      this.name,
      this.origin,
      this.referenceImageId,
      this.temperament,
      this.weight});

  DogModel.fromJson(Map<String, dynamic> json) {
    bredFor = json['bred_for'];
    breedGroup = json['breed_group'];
    height =
        json['height'] != null ? new Height.fromJson(json['height']) : null;
    id = json['id'];
    image = json['image'] != null ? new Image.fromJson(json['image']) : null;
    lifeSpan = json['life_span'];
    name = json['name'];
    origin = json['origin'];
    referenceImageId = json['reference_image_id'];
    temperament = json['temperament'];
    weight =
        json['weight'] != null ? new Height.fromJson(json['weight']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['bred_for'] = this.bredFor;
    data['breed_group'] = this.breedGroup;
    if (this.height != null) {
      data['height'] = this.height!.toJson();
    }
    data['id'] = this.id;
    if (this.image != null) {
      data['image'] = this.image!.toJson();
    }
    data['life_span'] = this.lifeSpan;
    data['name'] = this.name;
    data['origin'] = this.origin;
    data['reference_image_id'] = this.referenceImageId;
    data['temperament'] = this.temperament;
    if (this.weight != null) {
      data['weight'] = this.weight!.toJson();
    }
    return data;
  }
}

class Height {
  String? imperial;
  String? metric;

  Height({this.imperial, this.metric});

  Height.fromJson(Map<String, dynamic> json) {
    imperial = json['imperial'];
    metric = json['metric'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['imperial'] = this.imperial;
    data['metric'] = this.metric;
    return data;
  }
}

class Image {
  int? height;
  String? id;
  String? url;
  int? width;

  Image({this.height, this.id, this.url, this.width});

  Image.fromJson(Map<String, dynamic> json) {
    height = json['height'];
    id = json['id'];
    url = json['url'];
    width = json['width'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['height'] = this.height;
    data['id'] = this.id;
    data['url'] = this.url;
    data['width'] = this.width;
    return data;
  }
}
