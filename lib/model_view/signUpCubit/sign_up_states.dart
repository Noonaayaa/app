abstract class SignUpStates {}

class InitialState extends SignUpStates{}

// function sign up states
class SignUpLoadingState extends SignUpStates{}
class SignUpSuccessState extends SignUpStates{}
class SignUpErrorState extends SignUpStates{}