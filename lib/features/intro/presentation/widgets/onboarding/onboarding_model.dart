class OnboardingModel {
  final String image;
  final String title;
  final String description;

  const OnboardingModel({
    required this.image,
    required this.title,
    required this.description,
  });
}

const onboardingPages = [
  OnboardingModel(
    image: 'assets/splash/onb_1.png',
    title: 'A table for every\nmoment that\nmatters.',
    description:
        'Discover restaurants, book in seconds,\nand never miss a reservation.',
  ),
  OnboardingModel(
    image: 'assets/splash/onb_2.png',
    title: 'Your favorite\ndining spot,\nsecured instantly.',
    description:
        'Choose your preferred date, time, and\ntable with just a few taps.',
  ),
  OnboardingModel(
    image: 'assets/splash/onb_3.png',
    title: 'Book tables with\ncomplete peace\nof mind.',
    description:
        'Pay a fully refundable deposit online to\nguarantee your dining experience.',
  ),
];