class UnbordingContent {
  String title;
  String discription;
  String image;

  UnbordingContent(
      {required this.discription, required this.title, required this.image});
}

List<UnbordingContent> contents = [
  UnbordingContent(
      discription: 'How do you search for personlaized item\n on the internet?',
      title: 'Looking for something? ',
      image: 'assets/fonts/vector0.png'),
  UnbordingContent(
      discription:
          'Using the Cafia app, you simply submit a \n request, with a title of what you want, or\n with just a picture.',
      title: 'Submit a\n request ',
      image: 'assets/fonts/vector1.png'),
  UnbordingContent(
      discription:
          'And within minutes you get response from people with your requested need. It’s like making music request on the radio!',
      title: 'Request \n received ',
      image: 'assets/fonts/vector2.png'),
];
