enum PostStatusEnum {
  notposted,
  posted,
}

extension PostStatusEnumExtension on PostStatusEnum {
  static PostStatusEnum get(String name) {
    return PostStatusEnum.values
        .firstWhere((e) => e.name == name.toLowerCase());
  }
}
