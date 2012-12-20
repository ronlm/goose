using System;
using System.Windows.Forms;
using System.Data.SqlClient;
using System.Text;
using System.Runtime.InteropServices;
using System.Data;


namespace ShareFunction
{
	/// <summary>
	/// API_RF 的摘要说明。
	/// </summary>
	
	//
	//************************************操作RF读写器*************************
	//
	public class API_RF
	{
		public static byte KEY_A=0;
		public static byte KEY_B=4;
		public static byte _SecNo=0,BlockNo=0;
		public static int hCom=-1;
		public static byte[] PIN = new byte[8];		
		
		[DllImport("iccrf.dll")]
        public static extern int rf_init(int icdev,long baud); //打开通讯端口
		[DllImport("iccrf.dll")]
        public static extern int rf_exit(int icdev);           //关闭通讯端口
		[DllImport("iccrf.dll")]
        public static extern int rf_beep(int icdev, int _Msec);//读写器发声
		[DllImport("iccrf.dll")]
        public static extern int rf_get_status(int icdev,ref byte[] _Status);//
		[DllImport("iccrf.dll")]
        public static extern int rf_dispmsg(int icdev,byte nLen,char[] Msg);//显示信息
		[DllImport("iccrf.dll")]
        public static extern int rf_card(int icdev,byte _Mode,ref uint snr);//MODE：寻卡模式:0一次只对一张卡操作; 1一次对多张卡操作
		[DllImport("iccrf.dll")]
        public static extern int rf_load_key(int icdev,byte _Mode,byte _SecNr, byte[] _NKey);//MODE：密码验证模式（0 KEYA；4 KEYB）
		[DllImport("iccrf.dll")]
        public static extern int rf_authentication(int icdev,byte _Mode,byte SecNr);//MODE：密码验证模式（0 KEYA；4 KEYB）
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
