/*  Open Bionics - FingerLib Example - MultipleFingers
  Author - Olly McBride
  Date - October 2015

  This work is licensed under the Creative Commons Attribution-ShareAlike 4.0 International License.
  To view a copy of this license, visit http://creativecommons.org/licenses/by-sa/4.0/.

  Website - http://www.openbionics.com/
  GitHub - https://github.com/Open-Bionics
*/

#include <FingerLib.h>

/*
   WHAT IT DOES
   Uses the FingerLib.h library to open and close all fingers and thumb every 2 seconds
   Attaches the finger pins in the file 'Pins.ino'

*/

// uncomment one of the following to select the board
#define ALMOND_BOARD

// number of controllable fingers (number of motors)
#if defined(ALMOND_BOARD)
#define NUM_FINGERS 5
#define MYSERIAL Serial
#else
#error 'No board selected'
#endif

// uncomment one of the following to select which hand is used
//int handFlag = LEFT;
int handFlag = RIGHT;

// initialise Finger class to array
Finger finger[NUM_FINGERS];

#include <ros.h>
#include <std_msgs/String.h>
#include <std_msgs/Empty.h>
#include <std_msgs/Int32.h>
#include <bionic_hand/FingerPosition.h>

ros::NodeHandle  nh;

bionic_hand::FingerPosition finger_pos;
ros::Publisher chatter("finger_position", &finger_pos);

void messageCb( const std_msgs::Int32& toggle_msg) {
  // set all of the fingers to OPEN
  int pos;
  int pose = toggle_msg.data;
  //  openHand();
  //  MYSERIAL.println("Opening");
  //
  //  // give them time to OPEN
  //  delay(2000);

  if (pose == 1) {
    for (int i = 0; i < NUM_FINGERS; i++)
    {
      pos = 50;
      finger[i].writePos(map(pos, 0, 100, 0, 1023));
    }
  }
  else if (pose == 2) {
    for (int i = 0; i < NUM_FINGERS; i++)
    {
      pos = 100;
      finger[i].writePos(map(pos, 0, 100, 0, 1023));
    }
  }
  else if (pose == 3) {
    finger[0].close();
    finger[1].close();
    finger[2].open();
    finger[3].open();
    finger[4].open();
  }
  else if (pose == 4) {
    finger[0].open();
    finger[1].open();
    finger[2].close();
    finger[3].close();
    finger[4].close();
  }
  else if (pose == 5) {
    openHand();
  }

  //  // set all of the fingers to CLOSE
  //  closeHand();
  //  MYSERIAL.println("Closing");
  //
  //  // give them time to CLOSE
  //  delay(2000);
  //
  //  // set all of the fingers to OPEN
  //  openHand();
  //  MYSERIAL.println("Opening");

  // give them time to OPEN
  //  delay(2000);



}

ros::Subscriber<std_msgs::Int32> sub("/pose_arduino", messageCb );

void setup()
{
  // MYSERIAL.print is used to allow compatability between both the Mega (Serial.print)
  // and the Zero Native Port (SerialUSB.print), and is defined in FingerLib.h
  MYSERIAL.begin(38400);
  MYSERIAL.println("Started");

  // configure all of the finger pins
  pinAssignment();
  MYSERIAL.println("Pins configured");

  nh.initNode();
  nh.advertise(chatter);
  nh.subscribe(sub);
}

void loop()
{
  finger_pos.finger1 = finger[0].readPos();
  finger_pos.finger2 = finger[1].readPos();
  finger_pos.finger3 = finger[2].readPos();
  finger_pos.finger4 = finger[3].readPos();
  finger_pos.finger5 = finger[4].readPos();
  chatter.publish( &finger_pos );
  nh.spinOnce();
  delay(10);
}

// count through all the fingers and set them to open
void openHand(void)
{
  int i;
  for (i = 0; i < NUM_FINGERS; i++)
  {
    finger[i].open();
  }
}

// count through all the fingers and set them to close
void closeHand(void)
{
  int i;
  for (i = 0; i < NUM_FINGERS; i++)
  {
    finger[i].close();
  }
}



