const int MOTOR = 2;

void setup()
{

pinMode(MOTOR,OUTPUT);

}


void loop()
{

 digitalWrite(MOTOR,HIGH);// IT INDICATES MOTOR WIll OFF For 2 sec
 delay(2000);
 digitalWrite(MOTOR,LOW);// IT INDICATES MOTOR WILL ON FOR 8 sec
 delay(8000);

}
