abstract class SignUpStates {}

class InitialState extends SignUpStates{}

// function sign up states
class SignUpLoadingState extends SignUpStates{}
class SignUpSuccessState extends SignUpStates{}
class SignUpErrorState extends SignUpStates{}

class GetCameraImageSuccessState extends SignUpStates{}
class GetCameraImageErrorState extends SignUpStates{}

class GetGalleryImageSuccessState extends SignUpStates{}
class GetGalleryImageErrorState extends SignUpStates{}


class ChangePasswordState extends SignUpStates{}

class ShowDateState extends SignUpStates{}