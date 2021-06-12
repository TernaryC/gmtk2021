function print () {
    /// Prints a message to the console. Takes any amount of parameters
    ///  Used for debugging
    
    var message = "";
    for (var i = 0; i < argument_count; i++) {
        message += string(argument[i]);
        if (i != argument_count - 1) message += " ";
    }
    show_debug_message(message);
    return message;
}