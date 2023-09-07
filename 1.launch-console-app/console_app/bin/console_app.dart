void main(List<String> arguments) {
  if (arguments.length >= 3) {
    String arg0 = arguments[0];
    String arg1 = arguments[1];
    String arg2 = arguments[2];
    
    print("Первый аргумент: $arg0, Второй аргумент: $arg1, Третий аргумент: $arg2");
  } else {
    print("Введите 3 аргумента");
  }
}
