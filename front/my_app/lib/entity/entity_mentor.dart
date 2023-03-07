class MentorEntity {
  final String name;
  final String skill;
  final String profile;
  final String imageProfile;
  final String availability;
  final int slots;
  final int likes;
  final double rate;

  MentorEntity(
      {required this.name,
      required this.skill,
      required this.profile,
      required this.imageProfile,
      required this.availability,
      required this.slots,
      required this.likes,
      required this.rate});
}
