using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;
using ShareFunction;


namespace Project1
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            if (button1.Text == "打开通讯口")
            {
                int port = Convert.ToInt16(COMPORT.Value) - 1;
                API_RF.hCom = 0;
                API_RF.hCom = API_RF.rf_init(port, 9600); //19200
                if (API_RF.hCom <= 0)
                {
                    listBox1.BeginUpdate();
                    listBox1.Items.Add("  打开通讯口COM" + (COMPORT.Value).ToString() + "失败！");
                    listBox1.EndUpdate();
                    //MessageBox.Show("打开通讯口COM" + (COMPORT.Value);.ToString(); + "失败！", "错误", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    return;
                }
                else
                {
                    button1.Text = "关闭通讯口";
                    button2.Enabled = true;
                    button3.Enabled = true;
                    button4.Enabled = true;
                    //button5.Enabled = true;
                    listBox1.BeginUpdate();
                    listBox1.Items.Add("  打开通讯口COM" + (COMPORT.Value).ToString() + "成功！");
                    listBox1.EndUpdate();
                    return;
                }
            }
            else
            {
                API_RF.rf_exit(API_RF.hCom);
                API_RF.hCom = 0;
                button1.Text = "打开通讯口";
                button2.Enabled = false;
                button3.Enabled = false;
                button4.Enabled = false;
             //   button5.Enabled = false;
                return;
            
            }

        }

        private void button2_Click(object sender, EventArgs e)
        {
            int ret;
            uint snr=0;
            byte[] rbuf=new byte[16];
            byte[] wbuf=new byte[16];
            byte[] KeyBuf=new byte[6];
           

            //listBox1.BeginUpdate();
            listBox1.Items.Add("             对卡进行读写操作!");
            listBox1.Items.Add(" 调用rf_card();函数"); //询卡 

            ret = API_RF.rf_card(API_RF.hCom ,0,ref snr);
            if (ret==0) 
               	            listBox1.Items.Add(" ok! ");
            else
            {
               	            listBox1.Items.Add(" 无卡!");
                            return;
            }

              listBox1.Items.Add(" 调用rf_load_key();函数"); //装载密码

              API_RF._SecNo  = 9; //第9扇区
              API_RF.BlockNo = 0; //第0块 ，可以是0,1,2。   第3块是密码块，不能随便更改，否则你会后悔
              API_RF.PIN[0] = 0xff;
              API_RF.PIN[1] = 0xff;
              API_RF.PIN[2] = 0xff;
              API_RF.PIN[3] = 0xff;
              API_RF.PIN[4] = 0xff;
              API_RF.PIN[5] = 0xff;
              ret = API_RF.rf_load_key(API_RF.hCom, API_RF.KEY_A,API_RF._SecNo,API_RF.PIN);
              if (ret==0)
               	            listBox1.Items.Add(" ok! ");
              else
              {
               	            listBox1.Items.Add(" 错误!");
                            return;
              }

              listBox1.Items.Add(" 调用rf_autication();函数"); //校验密码
              ret = API_RF.rf_authentication(API_RF.hCom, API_RF.KEY_A, API_RF._SecNo);
              if (ret==0)    //验证密码
		            listBox1.Items.Add(" ok! ");
              else
              {
		            listBox1.Items.Add(" 校验密码失败!");
                    return;
              }

              listBox1.Items.Add(" 调用rf_write();函数 ");
              
              wbuf[0]=0x30;
              wbuf[1]=0x31;
              wbuf[2]=0x32;
              wbuf[3]=0x33;
              wbuf[4]=0x34;
              wbuf[5]=0x35;
              wbuf[6]=0x36;
              wbuf[7]=0x37;
              wbuf[8]=0x38;
              wbuf[9]=0x39;
              wbuf[10]=0x65;
              wbuf[11]=0x66;
              wbuf[12]=0x67;
              wbuf[13]=0x68;
              wbuf[14]=0x69;
              wbuf[15]=0x70;
	          ret=API_RF.rf_write(API_RF.hCom,Convert.ToByte(API_RF._SecNo *4+API_RF.BlockNo),wbuf);
              if (ret == 0)         //写数据
		            listBox1.Items.Add(" ok! ");
	            else
              {
		            listBox1.Items.Add(" 写卡失败!");
                return;
              }

              listBox1.Items.Add(" 调用rf_read();函数 ");
              //rbuf.
	            ret=API_RF.rf_read(API_RF.hCom,Convert.ToByte(API_RF._SecNo*4+API_RF.BlockNo),rbuf); //读数据
              if (ret == 0)        //写数据
		            listBox1.Items.Add(" ok! ");
	            else
		            listBox1.Items.Add(" 错误! ");
              API_RF.rf_beep(API_RF.hCom,80);
        }

        private void button3_Click(object sender, EventArgs e)
        {
            int ret;
            uint snr = 0;
            byte[] rbuf = new byte[16];
            byte[] wbuf = new byte[16];
            byte[] KeyBuf = new byte[6];


            //1:更改密码与读写操作完全一样，只不过是第3块，（0，1，2为数据块）
            //2:块3的结构：  6 字节长度的密码A   4字节长度的控制字  6 字节长度的密码B
            //3:正常情况下你只要更改“6字节长度的密码A”就可以
            //4:除非你对M1卡控制字非常了解，不然不要更改，本人不小心写坏过2000张卡，当时损失1万多元
            //本例子只对密码A更改
            
            listBox1.Items.Add("*****************卡片密码操作（KEYA）******************");
            listBox1.Items.Add(" 调用rf_card();函数"); //询卡 

            ret = API_RF.rf_card(API_RF.hCom, 0, ref snr);
            if (ret == 0)
                listBox1.Items.Add(" ok! ");
            else
            {
                listBox1.Items.Add(" 无卡!");
                return;
            }

            listBox1.Items.Add(" 调用rf_load_key();函数"); //装载密码

            API_RF._SecNo = 9; //第9扇区,取值范围0~15
            API_RF.BlockNo = 3; //第3块是密码块，不能随便更改，否则你会后悔
            API_RF.PIN[0] = 0xff;
            API_RF.PIN[1] = 0xff;
            API_RF.PIN[2] = 0xff;
            API_RF.PIN[3] = 0xff;
            API_RF.PIN[4] = 0xff;
            API_RF.PIN[5] = 0xff;
            ret = API_RF.rf_load_key(API_RF.hCom, API_RF.KEY_A, API_RF._SecNo, API_RF.PIN);
            if (ret == 0)
                listBox1.Items.Add(" ok! ");
            else
            {
                listBox1.Items.Add(" 错误!");
                return;
            }

            listBox1.Items.Add(" 调用rf_autication();函数"); //校验密码
            ret = API_RF.rf_authentication(API_RF.hCom, API_RF.KEY_A, API_RF._SecNo);
            if (ret == 0)    //验证密码
                listBox1.Items.Add(" ok! ");
            else
            {
                listBox1.Items.Add(" 校验密码失败!");
                return;
            }



            listBox1.Items.Add(" 调用rf_read()函数,读出块3的内容 ");
            //rbuf.
            ret = API_RF.rf_read(API_RF.hCom, Convert.ToByte(API_RF._SecNo * 4 + API_RF.BlockNo), rbuf); //读数据
            if (ret == 0)        //写数据
                listBox1.Items.Add(" ok! ");
            else
                listBox1.Items.Add(" 错误! ");
            

            listBox1.Items.Add(" 调用rf_write()函数，改密码 ");


            //******************注意**********************
            //1。先读出控制块的内容到rbuf
            //2。将rubf[0]...rub[5]，换成新密码，其它内容不更改
            //3。用rf_write函数将rbuf写入卡中，更改结束

            rbuf.CopyTo(wbuf, 0); 
            //以下是新密码
            wbuf[0] = 0xff;
            wbuf[1] = 0xff;
            wbuf[2] = 0xff;
            wbuf[3] = 0xff;
            wbuf[4] = 0xff;
            wbuf[5] = 0xff;
            ret = API_RF.rf_write(API_RF.hCom, Convert.ToByte(API_RF._SecNo * 4 + API_RF.BlockNo), wbuf);
            if (ret == 0)         //写数据
                listBox1.Items.Add(" ok! ");
            else
            {
                listBox1.Items.Add(" 更改失败!");
                return;
            }

            API_RF.rf_beep(API_RF.hCom, 80);



        }

        private void button5_Click(object sender, EventArgs e)
        {

        }

        private void listBox1_DoubleClick(object sender, EventArgs e)
        {
            listBox1.Items.Clear();  
        }

        private void button4_Click(object sender, EventArgs e)
        {

            int ret;
            uint snr=0;
            byte[] rbuf=new byte[16];
            byte[] wbuf=new byte[16];
            byte[] KeyBuf=new byte[6];
            uint RValue=0, Initvalue, Addvalue, Cutvalue;

           

            listBox1.Items.Add("             电子钱包操作!");
            listBox1.Items.Add(" 调用rf_card();函数"); //询卡 

            ret = API_RF.rf_card(API_RF.hCom ,0,ref snr);
            if (ret==0) 
               	            listBox1.Items.Add(" ok! ");
            else
            {
               	            listBox1.Items.Add(" 无卡!");
                            return;
            }

              listBox1.Items.Add(" 调用rf_load_key();函数"); //装载密码

              API_RF._SecNo  = 9; //第9扇区
              API_RF.BlockNo = 0; //第0块 ，可以是0,1,2。   第3块是密码块，不能随便更改，否则你会后悔
              API_RF.PIN[0] = 0xff;
              API_RF.PIN[1] = 0xff;
              API_RF.PIN[2] = 0xff;
              API_RF.PIN[3] = 0xff;
              API_RF.PIN[4] = 0xff;
              API_RF.PIN[5] = 0xff;
              ret = API_RF.rf_load_key(API_RF.hCom, API_RF.KEY_A,API_RF._SecNo,API_RF.PIN);
              if (ret==0)
               	            listBox1.Items.Add(" ok! ");
              else
              {
               	            listBox1.Items.Add(" 错误!");
                            return;
              }

              listBox1.Items.Add(" 调用rf_autication();函数"); //校验密码
              ret = API_RF.rf_authentication(API_RF.hCom, API_RF.KEY_A, API_RF._SecNo);
              if (ret==0)    //验证密码
		            listBox1.Items.Add(" ok! ");
              else
              {
		            listBox1.Items.Add(" 校验密码失败!");
                    return;
              }

              

             //开始电子钱包操作
              listBox1.Items.Add(" 调用rf_initval()函数 "); //钱包初始化
              API_RF.BlockNo=1;
              Initvalue=100; //钱包初始值为100，可以为0，也可以为非0
	          ret=API_RF.rf_initval(API_RF.hCom,Convert.ToByte(API_RF._SecNo * 4 + API_RF.BlockNo),Initvalue);
              if (ret==0)
        	        listBox1.Items.Add(" ok! ");
	          else
		            listBox1.Items.Add(" 错误!");

             listBox1.Items.Add(" 调用rf_readval()函数 "); //读钱包余额

             ret = API_RF.rf_readval(API_RF.hCom, Convert.ToByte(API_RF._SecNo * 4 + API_RF.BlockNo), ref RValue);    //读当前值
             if (ret==0)
                listBox1.Items.Add("钱包初始值:"+Convert.ToString(RValue));
             else
		        listBox1.Items.Add(" 错误!" );


              listBox1.Items.Add(" 调用rf_increment()函数，增值50 ");
              Addvalue=50;
	          ret=API_RF.rf_increment(API_RF.hCom,Convert.ToByte(API_RF._SecNo * 4 + API_RF.BlockNo),Addvalue);   //增值操作
              if (ret == 0) 
		            listBox1.Items.Add(" ok! ");
	          else
		            listBox1.Items.Add(" 错误!");

              listBox1.Items.Add(" 调用rf_transfer()函数 ");

	          ret=API_RF.rf_transfer(API_RF.hCom,Convert.ToByte(API_RF._SecNo * 4 + API_RF.BlockNo));  //将寄存器的内容传送到EEPROM中
              if (ret == 0) 
		            listBox1.Items.Add(" ok! ");
	          else
		            listBox1.Items.Add(" 错误!");


             ret=API_RF.rf_readval(API_RF.hCom,Convert.ToByte(API_RF._SecNo * 4 + API_RF.BlockNo),ref RValue);     //读当前值
             if (ret == 0)              
                listBox1.Items.Add("现余额:"+Convert.ToString(RValue));             
             else
		            listBox1.Items.Add("读电子钱包失败!" );

              listBox1.Items.Add(" 调用rf_decrement()函数，减值10 ");
              Cutvalue=10;
	          ret=API_RF.rf_decrement(API_RF.hCom,Convert.ToByte(API_RF._SecNo * 4 + API_RF.BlockNo),Cutvalue);   //减值操作
                if (ret == 0)
                    listBox1.Items.Add(" ok! ");
                else
                    listBox1.Items.Add(" 错误!");

	            listBox1.Items.Add(" 调用rf_transfer()函数 ");

	            ret=API_RF.rf_transfer(API_RF.hCom,Convert.ToByte(API_RF._SecNo * 4 + API_RF.BlockNo));
              if (ret == 0) 
		            listBox1.Items.Add(" ok! ");
	            else
		            listBox1.Items.Add(" 错误!");

             ret=API_RF.rf_readval(API_RF.hCom,Convert.ToByte(API_RF._SecNo * 4 + API_RF.BlockNo),ref RValue);     //读当前值
             if (ret == 0) 
             {
                listBox1.Items.Add("现余额:"+Convert.ToByte(RValue));
             }
             else
		            listBox1.Items.Add("读电子钱包失败!" );

            API_RF.rf_beep(API_RF.hCom,80);

        }
    }
}