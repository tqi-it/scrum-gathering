import 'package:mentorme/app/shared/data/extension.dart';

enum SocialMediaEnum { linkedin, whatsapp, twitter, telegram, instagram, facebook, email, other }


extension SocialMediaExtension on SocialMediaEnum {
  String get stringValue {
    String _value = '';
    switch (this) {
      case SocialMediaEnum.linkedin:
        _value = 'LINKEDIN';
        break;
      case SocialMediaEnum.whatsapp:
        _value = 'WHATSAPP';
        break;
      case SocialMediaEnum.twitter:
        _value = 'TWITTER';
        break;
      case SocialMediaEnum.telegram:
        _value = 'TELEGRAM';
        break;
      case SocialMediaEnum.instagram:
        _value = 'INSTAGRAM';
        break;
      case SocialMediaEnum.facebook:
        _value = 'FACEBOOK';
        break;
      case SocialMediaEnum.email:
        _value = 'EMAIL';
        break;
      default:
        _value = 'OUTRO';
        break;
    }

    return _value.capitalizeFirstofEach;
  }

}