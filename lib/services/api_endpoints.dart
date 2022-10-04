
class APIEndpoints{

  static const UserController = "/users";
  static const events = "/events";
  // User Login And Signup
  static const String loginURL=UserController+"/login";
  //Follow User
  static const String follow=UserController+"/follow";
  //Post
  static const String posts="/posts";
  // Payment
  static const String payment="/payment";
  //secretKey
  static const secretKey="sk_test_51KRIHRBibYzyRPGcyxHn65xEaGpS0XXC3OoqSKwtiicCxlm5M6j9GDA6ePVOykk5gnjKLkPHLtKf1gJky86tfiMB009wBGMpDs";
  //publishableKey
  static const publishableKey="pk_test_51KRIHRBibYzyRPGcFTG4PGMZSmeiFphWgRwB7fVPSuUEMxUUVLnD8oHfqgsgqCYsReHYd9mLlto32YRROEBr0rXw00Ri37518r";

  //Tags
  static const String tags="/tags";

  //Image URL
  static const String ImageURL="https://igive.thewebtestlink.xyz";


  // Events
    //Near By Events
    static const String nearByEvents=events+"/nearby";
    static const String myEvent=events+"/myEvents";
    static const String attended=events+"/myEvents";
    static const String enrolled=events+"/myEvents";
    //Charity Sermon Events
    static const String charityAndSermonEvents=events+"/feed";
    //Upcoming Events
    static const String upcoming=events+"/upcoming";
    //Post Feeds
    static const String feed=posts+"/feed";
    // Recommended
    static const String recommended=events+"/recommended";
    //My Post
    static const String myPost=posts+"/myPosts";
    // followers
  static const String followers=UserController+"/followers";
  static const String followings=UserController+"/followings";
    // Comments
     static const String comments=posts+"/comments";

     //Profile Update
  static const String profilePicture=UserController+"/profilePicture";

    // User Profile Data
  static const String userProfile=UserController+"/userProfile";

  //Tags feed
  static const String tagsFeed=tags+"/feed";
  static const String updateMeetingStatus="/events/updateMeetingStatus/";



}