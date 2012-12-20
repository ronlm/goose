using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;
using ShareFunction;
using System.Runtime.Serialization;
using System.Runtime.Serialization.Formatters.Binary;
using System.IO;
using Identify.WebReference;
using System.Runtime.InteropServices;  

namespace Project1
{
    public partial class RFID : Form
    {
        public const int WM_DEVICECHANGE = 0x219;
        public const int DBT_DEVNODES_CHANGED = 0x0007;
        private bool haveRC = false;

        public RFID()
        {
            InitializeComponent();
        }

        private void RFID_Load(object sender, EventArgs e)
        {
            timer1.Start();
            initRFID();
            if (!haveRC) {
                MessageBox.Show("检测不到读卡器！");
            }
        }

        private void initRFID(){
            try
            {
                API_RF.hCom = API_RF.rf_init(0xFF, 9600); //初始化串口
                if (API_RF.hCom > 0) {
                    haveRC = true;
                }
            }
            catch (Exception ex)
            {
                if (MessageBox.Show("初始化串口失败,是否再次尝试初始化?", "确认消息", MessageBoxButtons.OKCancel, MessageBoxIcon.Question) == DialogResult.Cancel)
                {
                    Application.Exit();
                }
            }
        }

        private void RFID_FormClosing(object sender, FormClosingEventArgs e)
        {
            Application.Exit();
        }

        //监测windows消息，判断读卡器是否插入
        protected override void WndProc(ref Message m)
        {
            try
            {
                if (m.Msg == WM_DEVICECHANGE)
                {
                    switch (m.WParam.ToInt32())
                    {
                        case DBT_DEVNODES_CHANGED:
                            if (haveRC) { haveRC = false; }
                            else { 
                                initRFID(); //初始化串口
                            }
                            break;
                        default:
                            break;
                    }
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
            base.WndProc(ref m);
        }
      
        private void timer1_Tick(object sender, EventArgs e)
        {
            readCard();
        }

        private void readCard()
        {
            int ret;
            uint snr = 0;
            byte[] rbuf = new byte[16];
            byte[] wbuf = new byte[16];
            byte[] KeyBuf = new byte[6];

            ret = API_RF.rf_card(API_RF.hCom, 0, ref snr);   //寻卡
            
            if (ret == 0)
            {
                if (loadKey())
                {
                    feedback(snr);//显示读卡信息
                }
            }
        }

        private bool loadKey()
        {
            int ret;
            API_RF._SecNo = 5; //第5扇区

            API_RF.PIN[0] = 0x9c;
            API_RF.PIN[1] = 0x00;
            API_RF.PIN[2] = 0x0f;
            API_RF.PIN[3] = 0x6f;
            API_RF.PIN[4] = 0x2e;
            API_RF.PIN[5] = 0x0e;
            ret = API_RF.rf_load_key(API_RF.hCom, API_RF.KEY_A, API_RF._SecNo, API_RF.PIN);
            if (ret != 0)
            {
                listBox1.Items.Add("下载密码失败!");
                API_RF.rf_halt(API_RF.hCom);
                return false;
            }
            ret = API_RF.rf_authentication(API_RF.hCom, API_RF.KEY_A, API_RF._SecNo);
            if (ret != 0)
            {    //验证密码
                listBox1.Items.Add("非农友公司产品，谨防假冒！");
                API_RF.rf_beep(API_RF.hCom, 5);
                API_RF.rf_halt(API_RF.hCom);
                return false;
            }
            return true;
        }

        private void feedback(uint snr)
        {
            int ret;
            byte[] buf = new byte[16];
            ret = API_RF.rf_read(API_RF.hCom, Convert.ToByte(API_RF._SecNo * 4 + API_RF.BlockNo), buf); //读数据
           
                if (ret == 0)
                {
                    if (buf[0] == 0x00)
                    {
                        listBox1.Items.Add("农友公司产品，鹅只已死亡！脚环号 " + snr);
                        listBox1.SelectedIndex = listBox1.Items.Count - 1;
                        API_RF.rf_beep(API_RF.hCom, 1);
                    }
                    else if (buf[0] == 0x01)
                    {
                        listBox1.Items.Add("农友公司产品，鹅只已入场！脚环号 " + snr);
                        listBox1.SelectedIndex = listBox1.Items.Count - 1;
                        API_RF.rf_beep(API_RF.hCom, 1);
                    }
                    else if (buf[0] == 0x02)
                    {
                        listBox1.Items.Add("农友公司产品，鹅只已出售！脚环号 " + snr);
                        listBox1.SelectedIndex = listBox1.Items.Count - 1;
                        API_RF.rf_beep(API_RF.hCom, 1);
                    }
                    else if (buf[0] == 0x04)
                    {
                        listBox1.Items.Add("农友公司产品，鹅只已回购！脚环号 " + snr);
                        listBox1.SelectedIndex = listBox1.Items.Count - 1;
                        API_RF.rf_beep(API_RF.hCom, 1);
                    }
                    else {
                        listBox1.Items.Add("非农友公司产品，谨防假冒！");
                        listBox1.SelectedIndex = listBox1.Items.Count - 1;
                        API_RF.rf_beep(API_RF.hCom, 5);
                    }
                } 
            API_RF.rf_halt(API_RF.hCom);
        }

        private void button1_Click(object sender, EventArgs e)
        {
            listBox1.Items.Clear();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }

        private void button3_Click(object sender, EventArgs e)
        {
            MessageBox.Show("将脚环贴近读卡器感应区，听到“B”一声后拿开脚环即可。");
        }

       
    }

}
