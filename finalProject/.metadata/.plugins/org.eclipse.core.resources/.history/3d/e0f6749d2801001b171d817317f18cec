package bit.com.a.util;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.json.JSONObject;
import org.springframework.stereotype.Component;

import bit.com.a.dto.Youtube;

@Component
public class YoutubeParser {
	
	String urls = "https://www.youtube.com/results?search_query=";
	Map<String, String> htmls = new HashMap<String, String>();

	// 제일 중요!
	public Map<String, String> search(String s) {
		System.out.println("YoutubeParser search");
			
		htmls.clear();
		BufferedReader br = null;
		
		// 웹에서 데이터를 취득하기 위한 list
		JsonUtils.list.clear();
		JsonUtils.titleList.clear();		
		
		try {
			String ss = URLEncoder.encode(s, "utf-8");
			System.out.println(ss);
			
			URL url = new URL(urls + ss);
			br = new BufferedReader(new InputStreamReader(url.openStream(), "utf-8"));
			
			String msg = "";
			int pos = 0;
			String text = "";
			while((msg = br.readLine()) != null) {
				text += msg.trim();
			}
			//System.out.println(text);		// responseContext
			
			// 읽을 시작 위치
			pos = text.trim().indexOf("\"responseContext\"");
		//	System.out.println(pos);
			
			// 끝위치
			int endpos = text.indexOf("};", pos);
		//	System.out.println(endpos);
			
			String str = text.substring(pos-1, endpos+1);
		//	System.out.println(str);
			
			JSONObject json = new JSONObject(str);
			
			JsonUtils.jsonToMap(json);
			
			for (int i = 0; i < JsonUtils.titleList.size(); i++) {
			//	System.out.println(JsonUtils.list.get(i));
			//	System.out.println(JsonUtils.titleList.get(i));
				
				htmls.put(JsonUtils.list.get(i), JsonUtils.titleList.get(i));
			}			
			
		} catch (UnsupportedEncodingException e) {			
			e.printStackTrace();
		} catch (MalformedURLException e) {			
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	 			
		
		return htmls;
	}
	
	public List<Youtube> getTitles(String key) {
		
	//	search(key);
		
		List<Youtube> list = new ArrayList<Youtube>();		
		Map<String, String> map = search(key);  
		
		Iterator<String> it = map.keySet().iterator();
		while(it.hasNext()) {			
			String url = it.next();
			Youtube dto = new Youtube(map.get(url), url, "");
			list.add(dto); 
		}		
		
		return list;
	}
}







