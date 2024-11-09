import javax.persistence.*;

@Entity
@Table(name="orders")
public class Orders {
	
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int ID;
	private String Plan,ExtraService,Name;
	private long Mobile;
	private double Price;
	private String Status;
	public int getID() {
		return ID;
	}
	public void setID(int iD) {
		ID = iD;
	}
	public String getTitle() {
		return Plan;
	}
	public void setTitle(String plan) {
		Plan = plan;
	}
	public String getExtraService() {
		return ExtraService;
	}
	public void setExtraService(String extraService) {
		ExtraService = extraService;
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
	public double getPrice() {
		return Price;
	}
	public void setPrice(double price) {
		Price = price;
	}
	public String getStatus() {
		return Status;
	}
	public void setStatus(String status) {
		Status = status;
	}
	public Orders() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Orders(int iD, String plan, String extraService, String name, long mobile, double price, String status) {
		super();
		ID = iD;
		Plan = plan;
		ExtraService = extraService;
		Name = name;
		Mobile = mobile;
		Price = price;
		Status = status;
	}
	@Override
	public String toString() {
		return "Orders [ID=" + ID + ", Plan=" + Plan + ", ExtraService=" + ExtraService + ", Name=" + Name
				+ ", Mobile=" + Mobile + ", Price=" + Price + ", Status=" + Status + "]";
	}
	
}
