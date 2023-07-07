# NeuroTechRelief
Transcutaneous Electrical Nerve Stimulation (TENS) ‘’Portable device’’ (TENS) therapy relieves chronic and acute pain using low-voltage electrical current. The project aims to create a portable device using NeruoStimDuino and Arduino Due programmed with C++. The device will include an electric circuit and a TFT display for controlling the electrical pulses, and a mobile app for user convenience. Our goal is to provide pain relief for patients.
pic--------------------------------------------------------------------------------------------------------------------
The software that was used to implement the wiring Diagram is Fritzing. Fritzing is 
an electronics design and prototyping platform for makers, hobbyists, and educators. 
Easily create and document electronic projects. 
![image](https://github.com/912200Mm/NeuroTechRelief/assets/103856066/090f6b0a-2e41-4509-8af6-fe10d7e366e4)
As We See We Connect Nextion Display to UART2 in Esp32 "Rx2" & "Tx2" and Print The Orders In Main UART"Rx"&"Tx" The Arduino Mega take this Order And It translates Orders to NeurostMedino and then executes it 
![sad](https://github.com/912200Mm/NeuroTechRelief/assets/103856066/80e971a8-8ec0-450c-b751-470d1b2fa3e7)
This is the flowchart, the user opens the application, if the bluetooth is open, he will go to the home page, if otherwise he will ask to open it first, then after that there are two options for the user, if he will use our disease or he will choose the manual and then he will go to the settings and then he will choose any channel and enter The parameter will then enter the silliness of mode, after which it will choose which Chanel frequency to start with
