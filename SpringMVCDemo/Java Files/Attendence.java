import javax.persistence.*;
@Entity
@Table(name="Attendence")
public class Attendence {
	private int ID;
	private String Name;
	private long Mobile;
	private String Type;
	private java.util.Date Date;
	
	public int getID() {
		return ID;
	}

	public void setID(int iD) {
		ID = iD;
	}

	public String getName() {
		return Name;
	}

	public void setName(String name) {
		Name = name;
	}

	public long getMobile() {
		return Mobile;
	}

	public void setMobile(long mobile) {
		Mobile = mobile;
	}

	public String getType() {
		return Type;
	}

	public void setType(String type) {
		Type = type;
	}

	public java.util.Date getDate() {
		return Date;
	}

	public void setDate(java.util.Date date) {
		Date = date;
	}

	public Attendence() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Attendence(int iD, String name, long mobile, String type, java.util.Date date) {
		super();
		ID = iD;
		Name = name;
		Mobile = mobile;
		Type = type;
		Date = date;
	}

	@Override
	public String toString() {
		return "Attendence [ID=" + ID + ", Name=" + Name + ", Mobile=" + Mobile + ", Type=" + Type + ", Date=" + Date
				+ "]";
	}
	
}
