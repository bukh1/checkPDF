# check-PDF Windown

#step1 install QPDF on Windows:
https://sourceforge.net/projects/qpdf/
 
#step2. Extract the QPDF file
Once the download is complete, extract the .zip file to the folder of your choice, for example  
 C:\qpdf\

#step3. Set PATH to run QPDF from command line
Right click on This PC or My Computer on desktop and select Properties
Select Advanced system settings
Click on Environment Variables
In System Variables section, find Path variable and click Edit
Add the path of folder containing QPDF

#step4  Test QPDF installation
Open a new Command Prompt Type the following command to check if QPDF is installed successfully.

      qpdf --version
