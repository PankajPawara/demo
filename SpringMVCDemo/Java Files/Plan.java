
import javax.persistence.*;
@Entity
@Table(name="plans")
public class Plan {

	@GeneratedValue(strategy=GenerationType.AUTO)
	private int ID;
	private String Title,Description;
	private int Days;
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
	public int getDays() {
		return Days;
	}
	public void setDays(int days) {
		Days = days;
	}
	public double getPrice() {
		return Price;
	}
	public void setPrice(double price) {
		Price = price;
	}
	public Plan() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Plan(int iD, String title, String description, int days, double price) {
		super();
		ID = iD;
		Title = title;
		Description = description;
		Days = days;
		Price = price;
	}
	@Override
	public String toString() {
		return "Plan [ID=" + ID + ", Title=" + Title + ", Description=" + Description + ", Days=" + Days + ", Price="
				+ Price + "]";
	}
	
}
