var validateFactory = ({bool isFullName = false}) {
  Map validate(String txt) {
    if (txt.contains(RegExp(r'[0-9]'))) {
      return {"isValid": false, "message": "Numbers exception"};
    } else if (txt.contains(' ')) {
      return {"isValid": false, "message": "Space exception"};
    } else if (txt[0] != txt[0].toUpperCase()) {
      return {"isValid": false, "message": "Lowercase exception"};
    }

    return {"isValid": true, "message": "OK"};
  }

  if (isFullName) {
    return (String text) {
      assert(text.contains(' '), "Full name must contain a space");

      var parts = text.split(' ');
      var responseFirstName = validate(parts[0]);
      var responseLastName = validate(parts[1]);

      return responseFirstName["isValid"] == true &&
              responseLastName["isValid"] == true
          ? {"isValid": true, "message": "OK"}
          : {
              "isValid": false,
              "message":
                  "Full name exception:\n"
                  "${responseFirstName["isValid"] == false ? responseFirstName["message"] + " in First Name\n" : ""}"
                  "${responseLastName["isValid"] == false ? responseLastName["message"] + " in Last Name\n" : ""}",
            };
    };
  } else {
    return (String text) {
      assert(text.isNotEmpty, "Text must not be empty");

      return validate(text);
    };
  }
};
