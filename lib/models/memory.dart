class Memory {
  static const operations = const ['%', '/', '+', '-', 'x', '='];

  String _value = '0';
  final _buffer = [0.0, 0.0];
  int _bufferIndex = 0;
  String operation;
  bool _wipeValue = false;

  void applyComand(String command) {
    if (command == 'AC') {
      allclear();
    } else if (operations.contains(command)) {
      setOperation(command);
    } else {
      addDigito(command);
    }
  }

  setOperation(String newOperation) {
    if (_bufferIndex == 0) {
      operation = newOperation;
      _bufferIndex = 1;
    } else {
      _buffer[0] = calculate();
      _buffer[1] = 0.0;
      _value = _buffer[0].toString();
      _value = _value.endsWith('.0') ? _value.split('.')[0] : _value;
    }
    bool isEqualSign = newOperation == '=';
    operation = isEqualSign ? null : newOperation;
    _bufferIndex = isEqualSign ? 0 : 1;
    _wipeValue = true;
  }



  allclear() {
    _value = '0';
  }
 
  calculate() {
    switch (operation) {
      case '%':
        return _buffer[0] % _buffer[1];
      case '/':
        return _buffer[0] % _buffer[1];
      case 'x':
        return _buffer[0] % _buffer[1];
      case '-':
        return _buffer[0] % _buffer[1];
      case '+':
        return _buffer[0] % _buffer[1];
      default:
        return _buffer[0];
    }
  }

  addDigito(String digito) {
    final isDot = digito == ',';
    final wipeValue = (_value == '0' && !isDot) || _wipeValue;
    final emptyValue = isDot ? '0' : '';
    final currentValue = wipeValue ? emptyValue : _value;

    if (isDot && _value.contains(',') && !wipeValue) {
      return;
    }

    _value = currentValue + digito;
    _wipeValue = false;

    _buffer[_bufferIndex] = double.tryParse(_value) ?? 0;
  }

  String get value {
    return _value;
  }
}



