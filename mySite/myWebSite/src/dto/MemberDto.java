package dto;

import java.io.Serializable;

public class MemberDto implements Serializable {
	private String id;
	private String nickname;
	private String password;
	private String birthday;
	private String address;
	private String pnumber;
	private String email;
	private int cemail;
	private int cpnumber;
	private int auth;
	public MemberDto() {
	}
	public MemberDto(String id, String nickname, String password, String birthday, String address, String pnumber,
			String email, int cemail, int cpnumber, int auth) {
		super();
		this.id = id;
		this.nickname = nickname;
		this.password = password;
		this.birthday = birthday;
		this.address = address;
		this.pnumber = pnumber;
		this.email = email;
		this.cemail = cemail;
		this.cpnumber = cpnumber;
		this.auth = auth;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getBirthday() {
		return birthday;
	}
	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPnumber() {
		return pnumber;
	}
	public void setPnumber(String pnumber) {
		this.pnumber = pnumber;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getCemail() {
		return cemail;
	}
	public void setCemail(int cemail) {
		this.cemail = cemail;
	}
	public int getCpnumber() {
		return cpnumber;
	}
	public void setCpnumber(int cpnumber) {
		this.cpnumber = cpnumber;
	}
	public int getAuth() {
		return auth;
	}
	public void setAuth(int auth) {
		this.auth = auth;
	}
	@Override
	public String toString() {
		return "MemberDto [id=" + id + ", nickname=" + nickname + ", password=" + password + ", birthday=" + birthday
				+ ", address=" + address + ", pnumber=" + pnumber + ", email=" + email + ", cemail=" + cemail
				+ ", cpnumber=" + cpnumber + ", auth=" + auth + "]";
	}
}
