package cc.factory.com.dto;

import java.io.Serializable;

public class CalParam implements Serializable {

	private int seq;
	private String id;
	private String title;
	private String content;
	private String startdate;
	private String wdate;
	
	private int year;
	private int month;
	private int day;
	
	private int hour;
	private int min;
	
	public CalParam() {
	}





	public CalParam(int seq, String id, String title, String content, String startdate, String wdate, int year,
			int month, int day, int hour, int min) {
		super();
		this.seq = seq;
		this.id = id;
		this.title = title;
		this.content = content;
		this.startdate = startdate;
		this.wdate = wdate;
		this.year = year;
		this.month = month;
		this.day = day;
		this.hour = hour;
		this.min = min;
	}





	public int getSeq() {
		return seq;
	}





	public void setSeq(int seq) {
		this.seq = seq;
	}





	public String getId() {
		return id;
	}





	public void setId(String id) {
		this.id = id;
	}





	public String getTitle() {
		return title;
	}





	public void setTitle(String title) {
		this.title = title;
	}





	public String getContent() {
		return content;
	}





	public void setContent(String content) {
		this.content = content;
	}





	public String getStartdate() {
		return startdate;
	}





	public void setStartdate(String startdate) {
		this.startdate = startdate;
	}





	public String getWdate() {
		return wdate;
	}





	public void setWdate(String wdate) {
		this.wdate = wdate;
	}





	public int getYear() {
		return year;
	}





	public void setYear(int year) {
		this.year = year;
	}





	public int getMonth() {
		return month;
	}





	public void setMonth(int month) {
		this.month = month;
	}





	public int getDay() {
		return day;
	}





	public void setDay(int day) {
		this.day = day;
	}





	public int getHour() {
		return hour;
	}





	public void setHour(int hour) {
		this.hour = hour;
	}





	public int getMin() {
		return min;
	}





	public void setMin(int min) {
		this.min = min;
	}





	@Override
	public String toString() {
		return "CalParam [seq=" + seq + ", id=" + id + ", title=" + title + ", content=" + content + ", startdate="
				+ startdate + ", wdate=" + wdate + ", year=" + year + ", month=" + month + ", day=" + day + ", hour="
				+ hour + ", min=" + min + "]";
	}



	
}
