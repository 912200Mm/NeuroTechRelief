#define DEBUG_SERIAL_ENABLE
#define nexSerial Serial2

#define RXD2 16
#define TXD2 17

#include "BluetoothSerial.h"

#if !defined(CONFIG_BT_ENABLED) || !defined(CONFIG_BLUEDROID_ENABLED)
#error Bluetooth is not enabled! Please run `make menuconfig` to and enable it
#endif

BluetoothSerial SerialBT;
unsigned long time1;
const int ang = 39;
String A,D,T,F,P,L,Z,E;
String  EN="";
String SC="";
String Time="";
String TimeO="";
String Q="3";
 String  _var10="FREQ 1 50";
    
String _var11="AMPL 1 15";
 
 String _var12="FREQ 1 50";
 
 String _var13="ENAB 1 1";
 
 String _var14="STIM 1 20 0";

String  recon( String ch,  String value,  int catg){

  String cmd = "";
  String space = " ";
  switch(catg){
    case 1: //"FREQ":
      cmd = "FREQ"+ space +ch +space+ value  ;
      break;
    case 2://"ENAB":
      cmd = "ENAB"+ space + ch + space + value  ;
      break;
    case 3:/// "DURN":
      cmd = "DURN"+space + ch +space + value  ;
      break;
    case 4: //"AMPL":
      cmd = "AMPL"+space + ch +space + value  ;
      break;
    case 5://"STIM":
      cmd = "STIM"+space + ch +space + value +space +  "0" ;
      break;
    default:
      cmd="";
  }
  
  return cmd;
}



void setup()
{

Serial.begin(9600);
  Serial2.begin(115200, SERIAL_8N1, RXD2, TXD2);
 
 SerialBT.begin("NeuroTechRelief"); //Bluetooth device name
  Serial.println("The device started, now you can pair it with bluetooth!");
time1=millis();
}

void loop() 
{
  
 int x= analogRead(ang);
  String cmd_ctl="";
   String cmd_ctl1="";
   // String cmd_ctl2="";
   //  String cmd_ctl3="";
// String cmd_ctlq="";
  if(Serial2.available()>0)
  {
    String rec= Serial2.readStringUntil('\n'); //R1.1
    ///Serial.println(rec);
    
    if(rec[0]=='A')
    {
     // Serial.println("Set Amplitude");
      int len=rec.length()+1;
      String A=rec.substring(1,len);
     
      if(SC =="1"){
        cmd_ctl = recon(SC, P, 4);
      }else if(SC=="2"){
        cmd_ctl = recon(SC, A, 4);
      }
      Serial.println(cmd_ctl);
    }
    if(rec[0]=='F')
    {
  
      int len=rec.length()+1;
      String F=rec.substring(1,len);

    if(SC =="1"){
        cmd_ctl = recon(SC, E, 1);
      }else if(SC=="2"){
        cmd_ctl = recon(SC, F, 1);
      }
      Serial.println(cmd_ctl);
    }
    if(rec[0]=='T')
    {
  
      int len=rec.length()+1;
      Time=rec.substring(1,len);
     
    
    }
     if(rec[0]=='D')
    {
     
      int len=rec.length()+1;
      String D=rec.substring(1,len);
 
   if(SC =="1"){
        cmd_ctl = recon(SC, L, 3);
      }else if(SC=="2"){
        cmd_ctl = recon(SC, D, 3);
      }
      Serial.println(cmd_ctl);
    }
    ///////////////////////////////////////////
    if(rec[0]=='P')
    {
     // Serial.println("Set Amplitude");
      int len=rec.length()+1;
      String P=rec.substring(1,len);
     
      if(SC =="1"){
        cmd_ctl = recon(SC, P, 4);
      }else if(SC=="2"){
        cmd_ctl = recon(SC, A, 4);
      }
      Serial.println(cmd_ctl);
    }
    if(rec[0]=='E')
    {
  
      int len=rec.length()+1;
      String E=rec.substring(1,len);

    if(SC =="1"){
        cmd_ctl = recon(SC, E, 1);
      }else if(SC=="2"){
        cmd_ctl = recon(SC, F, 1);
      }
      Serial.println(cmd_ctl);
    }
    if(rec[0]=='Z')
    {
  
      int len=rec.length()+1;
      TimeO=rec.substring(1,len);
     
    
    }
     if(rec[0]=='L')
    {
     
      int len=rec.length()+1;
      String L=rec.substring(1,len);
 
   if(SC =="1"){
        cmd_ctl = recon(SC, L, 3);
      }else if(SC=="2"){
        cmd_ctl = recon(SC, D, 3);
      }
      Serial.println(cmd_ctl);
    }
    /////////////////////////////////////////////////
if(rec[0]=='4')
    {
   
     if(EN =="1"){
        cmd_ctl = recon(EN, TimeO, 5);
             
     
     
        // Serial.println(EN);
      }else if(EN=="2"){
           // Serial.println(EN);
        cmd_ctl = recon(EN, Time, 5);
          
      }else if(EN=="3"){
            //Serial.println("EN");
        cmd_ctl1 = recon("1", TimeO, 5);
       Serial.println(cmd_ctl1);
  cmd_ctl = recon("2", Time, 5);

      }
     
      //  Serial.println(cmd_ctlq);
  Serial.println(cmd_ctl);
 
    }
    if(rec[0]=='1')
    {
    
      _var10;
     delay(50);
 Serial.println(_var11);
 delay(50);
  Serial.println(_var12);
 delay(50);
  Serial.println(_var13);
 delay(50);
  Serial.println(_var14);
   
    }
    if(rec[0]=='2')
    {
    //  Serial.print("ECH1");
    EN="1";
    cmd_ctl = recon(SC, EN, 2);
 
//int SC;
    }
    if(rec[0]=='3')
    {
    //  Serial.print("ECH2");
  EN="2";  
  cmd_ctl = recon(SC, EN, 2);                                  
//int SC;
    }
    if(rec[0]=='5')
    {
      Serial.println("STOP");
    }
    if(rec[0]=='6')
    {
 
    SC="1";
      //Serial.print("SCH1");
     // Serial.println(SC);

    }
    if(rec[0]=='7')
    {
   
  SC="2";
     //Serial.print("SCH2");
   // Serial.println(SC);
    }
  
      if(rec[0]=='0')
    {
 EN="3";
 // Serial.println("3");
    }
        

   
  }
   if((unsigned long)millis()-time1>10){
    Serial2.print("add 1,0,");
     Serial2.print(x);
    Serial2.print(map(x,0,1023,128,255));
     Serial2.write(0xff);
       Serial2.write(0xff);
       Serial2.write(0xff);
         time1=millis();
   }
        if((unsigned long)millis()-time1>10){
    Serial2.print("n0.val=");
     Serial2.print(x);
      Serial2.print(map(x,0,1023,128,255));
      Serial2.write(0xff);
       Serial2.write(0xff);
         Serial2.write(0xff);
       
         time1=millis();
     }  
    
      if (Serial.available()) {
    SerialBT.write(Serial.read());
  }
  if (SerialBT.available()) {
    Serial.write(SerialBT.read());
  }
  delay(20);
    
}