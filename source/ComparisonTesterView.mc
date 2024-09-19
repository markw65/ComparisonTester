import Toybox.Activity;
import Toybox.Lang;
import Toybox.Time;
import Toybox.WatchUi;

var values as Array<Numeric or Char> = [42, 42f, 42l, 42d, '*'];

class ComparisonTesterView extends WatchUi.SimpleDataField {
  // Set the label of the data field here.
  function initialize() {
    SimpleDataField.initialize();
    label = "Bits";
  }

  // The given info object contains all the current workout
  // information. Calculate a value and return it in this method.
  // Note that compute() and onUpdate() are asynchronous, and there is no
  // guarantee that compute() will be called before onUpdate().
  function compute(
    info as Activity.Info
  ) as Numeric or Duration or String or Null {
    // See Activity.Info in the documentation for available information.
    var result = 0;
    var bit = 0;
    for (var i = 0; i < values.size(); i++) {
      for (var j = i + 1; j < values.size(); j++) {
        var tst = values[i] == values[j] ? 1 : 0;
        result += tst << bit;
        bit++;
      }
    }

    return result;
  }
}
