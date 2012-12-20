using System;
using System.Windows.Forms;
using System.Data.SqlClient;
using System.Text;
using System.Runtime.InteropServices;
using System.Data;


namespace ShareFunction
{
	/// <summary>
	/// API_RF ��ժҪ˵����
	/// </summary>
	
	//
	//************************************����RF��д��*************************
	//
	public class API_RF
	{
		public static byte KEY_A=0;
		public static byte KEY_B=4;
		public static byte _SecNo=0,BlockNo=0;
		public static int hCom=-1;
		public static byte[] PIN = new byte[8];		
		
		[DllImport("iccrf.dll")]
        public static extern int rf_init(int icdev,long baud); //��ͨѶ�˿�
		[DllImport("iccrf.dll")]
        public static extern int rf_exit(int icdev);           //�ر�ͨѶ�˿�
		[DllImport("iccrf.dll")]
        public static extern int rf_beep(int icdev, int _Msec);//��д������
		[DllImport("iccrf.dll")]
        public static extern int rf_get_status(int icdev,ref byte[] _Status);//
		[DllImport("iccrf.dll")]
        public static extern int rf_dispmsg(int icdev,byte nLen,char[] Msg);//��ʾ��Ϣ
		[DllImport("iccrf.dll")]
        public static extern int rf_card(int icdev,byte _Mode,ref uint snr);//MODE��Ѱ��ģʽ:0һ��ֻ��һ�ſ�����; 1һ�ζԶ��ſ�����
		[DllImport("iccrf.dll")]
        public static extern int rf_load_key(int icdev,byte _Mode,byte _SecNr, byte[] _NKey);//MODE��������֤ģʽ��0 KEYA��4 KEYB��
		[DllImport("iccrf.dll")]
        public static extern int rf_authentication(int icdev,byte _Mode,byte SecNr);//MODE��������֤ģʽ��0 KEYA��4 KEYB��
		[DllImport("iccrf.dll")]
        public static extern int rf_read(int icdev,byte _Adr,byte[] _Data);
		[DllImport("iccrf.dll")]
        public static extern int rf_write(int icdev,byte _Adr,byte[] _Data);
        [DllImport("iccrf.dll")]
        public static extern int rf_initval(int icdev, byte _Adr, uint _Value);
		[DllImport("iccrf.dll")]
        public static extern int rf_readval(int icdev,byte _Adr,ref uint _Value);
		[DllImport("iccrf.dll")]
        public static extern int rf_increment(int icdev,byte _Adr,uint _Value);
        [DllImport("iccrf.dll")]
        public static extern int rf_decrement(int icdev, byte _Adr, uint _Value);
		[DllImport("iccrf.dll")]
        public static extern int rf_transfer(int icdev,byte _Adr);
	}


}
