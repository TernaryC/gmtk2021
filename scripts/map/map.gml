///@returns float
///Returns value mapped from one range to another
function map (val, fromLow, fromHigh, toLow, toHigh) {
    return toLow + (toHigh - toLow) * ((val - fromLow) / (fromHigh - fromLow));
    //I don't know how this works either, btw
}