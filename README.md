# Stop Funding Hate Recorder

This project is used to record television signals 24/7 for [Stop Funding
Hate](https://stopfundinghate.info/) or similar projects.

The instructions in this README are incomplete as of yet.

## Hardware setup

Take a freeview box with HDMI output, connect the HDMI to a [Xiancai HDMI to USB
capture
card](https://www.amazon.co.uk/Capture-Camcorder-Definition-Acquisition-Broadcasting/dp/B089D8DB44),
and plug the capture card into a Raspberry Pi 4 (3 might work as well).

## Software setup

Clone this repository on a Raspberry Pi and run the shell script:

```
git clone https://github.com/StopFundingHate/sfh-recorder
cd sfh-recorder
./Loopwithpausenew.sh
```

While the script running, it will continuously capture the input stream, encode
it, and store it in 30-minute chunks. Uploading needs to be done separately.

## License

... license tbd when we make this public ...
