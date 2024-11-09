import javax.persistence.*;

@Entity
@Table(name="user")
public class User {
	private String Name,Email,Password,City,District,State;
	private long MobileNo;
	private int Pincode;
	
	public String getName() {
		return Name;
	}
	public void setName(String name) {
		Name = name;
	}
	public String getEmail() {
		return Email;
	}
	public void setEmail(String email) {
		Email = email;
	}
	public String getPassword() {
		return Password;
	}
	public void setPassword(String password) {
		Password = password;
	}
	public String getCity() {
		return City;
	}
	public void setCity(String city) {
		City = city;
	}
	public String getDistrict() {
		return District;
	}
	public void setDistrict(String district) {
		District = district;
	}
	public String getState() {
		return State;
	}
	public void setState(String state) {
		State = state;
	}
	public long getMobileNo() {
		return MobileNo;
	}
	public void setMobileNo(long mobileNo) {
		MobileNo = mobileNo;
	}
	public int getPincode() {
		return Pincode;
	}
	public void setPincode(int pincode) {
		Pincode = pincode;
	}
	public User() {
		super();
		// TODO Auto-generated constructor stub
	}
	public User(String name, String email, String password, String city, String district, String state, long mobileNo,
			int pincode) {
		super();
		Name = name;
		Email = email;
		Password = password;
		City = city;
		District = district;
		State = state;
		MobileNo = mobileNo;
		Pincode = pincode;
	}
	@Override
	public String toString() {
		return "User [Name=" + Name + ", MobileNo=" + MobileNo + ", Email=" + Email + ", Password=" + Password + ", City=" + City + ", District="
				+ District + ", State=" + State + ", Pincode=" + Pincode + "]";
	}
}
