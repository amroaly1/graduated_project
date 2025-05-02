String getErrorMessage(int errorCode) {
  switch (errorCode) {
    case 1:
      return "Validation error.";
    case 2:
      return "Verification code is not valid.";
    case 1000:
      return "Invalid credentials.";
    case 1001:
      return "Email not confirmed.";
    case 1002:
      return "User not found.";
    case 1003:
      return "Email already exists.";
    case 1004:
      return "Username already exists.";
    case 1005:
      return "Registration failed.";
    case 1006: // this should not display to user
      return "Invalid token.";
    case 1007: // this should not display to user
      return "Token creation failed.";
    case 1008:
      return "Unregistered email.";
    case 1009:
      return "External login failed.";
    case 1010:
      return "External login email is required.";
    case 1011:
      return "Unsupported external provider.";

    default:
      return "An unknown error occurred.";
  }
}
