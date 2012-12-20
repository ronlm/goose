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
            if (button1.Text == "��ͨѶ��")
            {
                int port = Convert.ToInt16(COMPORT.Value) - 1;
                API_RF.hCom = 0;
                API_RF.hCom = API_RF.rf_init(port, 9600); //19200
                if (API_RF.hCom <= 0)
                {
                    listBox1.BeginUpdate();
                    listBox1.Items.Add("  ��ͨѶ��COM" + (COMPORT.Value).ToString() + "ʧ�ܣ�");
                    listBox1.EndUpdate();
                    //MessageBox.Show("��ͨѶ��COM" + (COMPORT.Value);.ToString(); + "ʧ�ܣ�", "����", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    return;
                }
                else
                {
                    button1.Text = "�ر�ͨѶ��";
                    button2.Enabled = true;
                    button3.Enabled = true;
                    button4.Enabled = true;
                    //button5.Enabled = true;
                    listBox1.BeginUpdate();
                    listBox1.Items.Add("  ��ͨѶ��COM" + (COMPORT.Value).ToString() + "�ɹ���");
                    listBox1.EndUpdate();
                    return;
                }
            }
            else
            {
                API_RF.rf_exit(API_RF.hCom);
                API_RF.hCom = 0;
                button1.Text = "��ͨѶ��";
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
            listBox1.Items.Add("             �Կ����ж�д����!");
            listBox1.Items.Add(" ����rf_card();����"); //ѯ�� 

            ret = API_RF.rf_card(API_RF.hCom ,0,ref snr);
            if (ret==0) 
               	            listBox1.Items.Add(" ok! ");
            else
            {
               	            listBox1.Items.Add(" �޿�!");
                            return;
            }

              listBox1.Items.Add(" ����rf_load_key();����"); //װ������

              API_RF._SecNo  = 9; //��9����
              API_RF.BlockNo = 0; //��0�� ��������0,1,2��   ��3��������飬���������ģ����������
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
               	            listBox1.Items.Add(" ����!");
                            return;
              }

              listBox1.Items.Add(" ����rf_autication();����"); //У������
              ret = API_RF.rf_authentication(API_RF.hCom, API_RF.KEY_A, API_RF._SecNo);
              if (ret==0)    //��֤����
		            listBox1.Items.Add(" ok! ");
              else
              {
		            listBox1.Items.Add(" У������ʧ��!");
                    return;
              }

              listBox1.Items.Add(" ����rf_write();���� ");
              
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
              if (ret == 0)         //д����
		            listBox1.Items.Add(" ok! ");
	            else
              {
		            listBox1.Items.Add(" д��ʧ��!");
                return;
              }

              listBox1.Items.Add(" ����rf_read();���� ");
              //rbuf.
	            ret=API_RF.rf_read(API_RF.hCom,Convert.ToByte(API_RF._SecNo*4+API_RF.BlockNo),rbuf); //������
              if (ret == 0)        //д����
		            listBox1.Items.Add(" ok! ");
	            else
		            listBox1.Items.Add(" ����! ");
              API_RF.rf_beep(API_RF.hCom,80);
        }

        private void button3_Click(object sender, EventArgs e)
        {
            int ret;
            uint snr = 0;
            byte[] rbuf = new byte[16];
            byte[] wbuf = new byte[16];
            byte[] KeyBuf = new byte[6];


            //1:�����������д������ȫһ����ֻ�����ǵ�3�飬��0��1��2Ϊ���ݿ飩
            //2:��3�Ľṹ��  6 �ֽڳ��ȵ�����A   4�ֽڳ��ȵĿ�����  6 �ֽڳ��ȵ�����B
            //3:�����������ֻҪ���ġ�6�ֽڳ��ȵ�����A���Ϳ���
            //4:�������M1�������ַǳ��˽⣬��Ȼ��Ҫ���ģ����˲�С��д����2000�ſ�����ʱ��ʧ1���Ԫ
            //������ֻ������A����
            
            listBox1.Items.Add("*****************��Ƭ���������KEYA��******************");
            listBox1.Items.Add(" ����rf_card();����"); //ѯ�� 

            ret = API_RF.rf_card(API_RF.hCom, 0, ref snr);
            if (ret == 0)
                listBox1.Items.Add(" ok! ");
            else
            {
                listBox1.Items.Add(" �޿�!");
                return;
            }

            listBox1.Items.Add(" ����rf_load_key();����"); //װ������

            API_RF._SecNo = 9; //��9����,ȡֵ��Χ0~15
            API_RF.BlockNo = 3; //��3��������飬���������ģ����������
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
                listBox1.Items.Add(" ����!");
                return;
            }

            listBox1.Items.Add(" ����rf_autication();����"); //У������
            ret = API_RF.rf_authentication(API_RF.hCom, API_RF.KEY_A, API_RF._SecNo);
            if (ret == 0)    //��֤����
                listBox1.Items.Add(" ok! ");
            else
            {
                listBox1.Items.Add(" У������ʧ��!");
                return;
            }



            listBox1.Items.Add(" ����rf_read()����,������3������ ");
            //rbuf.
            ret = API_RF.rf_read(API_RF.hCom, Convert.ToByte(API_RF._SecNo * 4 + API_RF.BlockNo), rbuf); //������
            if (ret == 0)        //д����
                listBox1.Items.Add(" ok! ");
            else
                listBox1.Items.Add(" ����! ");
            

            listBox1.Items.Add(" ����rf_write()������������ ");


            //******************ע��**********************
            //1���ȶ������ƿ�����ݵ�rbuf
            //2����rubf[0]...rub[5]�����������룬�������ݲ�����
            //3����rf_write������rbufд�뿨�У����Ľ���

            rbuf.CopyTo(wbuf, 0); 
            //������������
            wbuf[0] = 0xff;
            wbuf[1] = 0xff;
            wbuf[2] = 0xff;
            wbuf[3] = 0xff;
            wbuf[4] = 0xff;
            wbuf[5] = 0xff;
            ret = API_RF.rf_write(API_RF.hCom, Convert.ToByte(API_RF._SecNo * 4 + API_RF.BlockNo), wbuf);
            if (ret == 0)         //д����
                listBox1.Items.Add(" ok! ");
            else
            {
                listBox1.Items.Add(" ����ʧ��!");
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

           

            listBox1.Items.Add("             ����Ǯ������!");
            listBox1.Items.Add(" ����rf_card();����"); //ѯ�� 

            ret = API_RF.rf_card(API_RF.hCom ,0,ref snr);
            if (ret==0) 
               	            listBox1.Items.Add(" ok! ");
            else
            {
               	            listBox1.Items.Add(" �޿�!");
                            return;
            }

              listBox1.Items.Add(" ����rf_load_key();����"); //װ������

              API_RF._SecNo  = 9; //��9����
              API_RF.BlockNo = 0; //��0�� ��������0,1,2��   ��3��������飬���������ģ����������
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
               	            listBox1.Items.Add(" ����!");
                            return;
              }

              listBox1.Items.Add(" ����rf_autication();����"); //У������
              ret = API_RF.rf_authentication(API_RF.hCom, API_RF.KEY_A, API_RF._SecNo);
              if (ret==0)    //��֤����
		            listBox1.Items.Add(" ok! ");
              else
              {
		            listBox1.Items.Add(" У������ʧ��!");
                    return;
              }

              

             //��ʼ����Ǯ������
              listBox1.Items.Add(" ����rf_initval()���� "); //Ǯ����ʼ��
              API_RF.BlockNo=1;
              Initvalue=100; //Ǯ����ʼֵΪ100������Ϊ0��Ҳ����Ϊ��0
	          ret=API_RF.rf_initval(API_RF.hCom,Convert.ToByte(API_RF._SecNo * 4 + API_RF.BlockNo),Initvalue);
              if (ret==0)
        	        listBox1.Items.Add(" ok! ");
	          else
		            listBox1.Items.Add(" ����!");

             listBox1.Items.Add(" ����rf_readval()���� "); //��Ǯ�����

             ret = API_RF.rf_readval(API_RF.hCom, Convert.ToByte(API_RF._SecNo * 4 + API_RF.BlockNo), ref RValue);    //����ǰֵ
             if (ret==0)
                listBox1.Items.Add("Ǯ����ʼֵ:"+Convert.ToString(RValue));
             else
		        listBox1.Items.Add(" ����!" );


              listBox1.Items.Add(" ����rf_increment()��������ֵ50 ");
              Addvalue=50;
	          ret=API_RF.rf_increment(API_RF.hCom,Convert.ToByte(API_RF._SecNo * 4 + API_RF.BlockNo),Addvalue);   //��ֵ����
              if (ret == 0) 
		            listBox1.Items.Add(" ok! ");
	          else
		            listBox1.Items.Add(" ����!");

              listBox1.Items.Add(" ����rf_transfer()���� ");

	          ret=API_RF.rf_transfer(API_RF.hCom,Convert.ToByte(API_RF._SecNo * 4 + API_RF.BlockNo));  //���Ĵ��������ݴ��͵�EEPROM��
              if (ret == 0) 
		            listBox1.Items.Add(" ok! ");
	          else
		            listBox1.Items.Add(" ����!");


             ret=API_RF.rf_readval(API_RF.hCom,Convert.ToByte(API_RF._SecNo * 4 + API_RF.BlockNo),ref RValue);     //����ǰֵ
             if (ret == 0)              
                listBox1.Items.Add("�����:"+Convert.ToString(RValue));             
             else
		            listBox1.Items.Add("������Ǯ��ʧ��!" );

              listBox1.Items.Add(" ����rf_decrement()��������ֵ10 ");
              Cutvalue=10;
	          ret=API_RF.rf_decrement(API_RF.hCom,Convert.ToByte(API_RF._SecNo * 4 + API_RF.BlockNo),Cutvalue);   //��ֵ����
                if (ret == 0)
                    listBox1.Items.Add(" ok! ");
                else
                    listBox1.Items.Add(" ����!");

	            listBox1.Items.Add(" ����rf_transfer()���� ");

	            ret=API_RF.rf_transfer(API_RF.hCom,Convert.ToByte(API_RF._SecNo * 4 + API_RF.BlockNo));
              if (ret == 0) 
		            listBox1.Items.Add(" ok! ");
	            else
		            listBox1.Items.Add(" ����!");

             ret=API_RF.rf_readval(API_RF.hCom,Convert.ToByte(API_RF._SecNo * 4 + API_RF.BlockNo),ref RValue);     //����ǰֵ
             if (ret == 0) 
             {
                listBox1.Items.Add("�����:"+Convert.ToByte(RValue));
             }
             else
		            listBox1.Items.Add("������Ǯ��ʧ��!" );

            API_RF.rf_beep(API_RF.hCom,80);

        }
    }
}