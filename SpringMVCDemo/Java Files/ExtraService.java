import javax.persistence.*;
@Entity
@Table(name="extraservice")
public class ExtraService {
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int ID;
	private String Title,Description;
	private double Price;
	public int getID() {
		return ID;
	}
	public void setID(int iD) {
		ID = iD;
	}
	public String getTitle() {
		return Title;
	}
	public void setTitle(String title) {
		Title = title;
	}
	public String getDescription() {
		return Description;
	}
	public void setDescription(String description) {
		Description = description;
	}
	public double getPrice() {
		return Price;
	}
	public void setPrice(double price) {
		Price = price;
	}
	public ExtraService() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ExtraService(int iD, String title, String description, double price) {
		super();
		ID = iD;
		Title = title;
		Description = description;
		Price = price;
	}
	@Override
	public String toString() {
		return "ExtraService [ID=" + ID + ", Title=" + Title + ", Description=" + Description + ", Price=" + Price
				+ "]";
	}
}
