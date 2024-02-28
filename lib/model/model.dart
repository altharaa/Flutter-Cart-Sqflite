class Model {
    late int id;
    late String productImage;
    late String productName;
    late ProductCategory productCategory;
    late int productPrice;

    Map<String, dynamic> toJson() => {
        "id": id,
        "product_image": productImage,
        "product_name": productName,
        "product_category": productCategoryValues.reverse[productCategory],
        "product_price": productPrice,
    };
}

enum ProductCategory {
    ANTING,
    CINCIN,
    GELANG,
    KALUNG,
    LIONTIN
}

final productCategoryValues = EnumValues({
    "Anting": ProductCategory.ANTING,
    "Cincin": ProductCategory.CINCIN,
    "Gelang": ProductCategory.GELANG,
    "Kalung": ProductCategory.KALUNG,
    "Liontin": ProductCategory.LIONTIN
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
