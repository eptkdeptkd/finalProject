package bit.com.a.util;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

public class CalendarHelp {
	
	private String msg;
	private String mdate;
	
	public void setMdate(String mdate) {
		this.mdate = mdate;
	}
	
	public String getMdate(){
		System.out.println("mdate:" + mdate);
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일 hh시 mm분");
		String s = mdate.substring(0, 4) + "-" + mdate.substring(4, 6) + "-" + mdate.substring(6, 8) + " "
				+ mdate.substring(8, 10) + ":" + mdate.substring(10, 12) + ":00";
		
		Timestamp d = Timestamp.valueOf(s);
		
		return mdate = sdf.format(d);
	}	
}
