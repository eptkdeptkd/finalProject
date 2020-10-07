package cc.factory.com.util;

import java.util.Date;

public class PdsUtil {
	
	// myfile.txt => f.indexOf('.') -> 6
	// 파일명,  확장자명
	// f.substring( 6 ) => .txt
	// f.substring( 0, 6 ) => myfile
	
	// myfile.txt -> 322432432432.txt	
	public static String getNewFileName(String f) {
		String filename = "";
		String fpost = "";
		
		if(f.indexOf('.') >= 0) {	// 확장자명이 있음
			fpost = f.substring( f.indexOf('.') );	// .txt
			filename = new Date().getTime() + fpost;	// 43325432243.txt
		}
		else {
			filename = new Date().getTime() + ".back";
		}
		
		return filename;
	}

}
