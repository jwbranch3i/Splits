package dataModel;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

import javafx.beans.property.ObjectProperty;
import javafx.beans.property.SimpleDoubleProperty;
import javafx.beans.property.SimpleObjectProperty;
import javafx.beans.property.SimpleStringProperty;

public class Transaction
{
	private int _id = 0;
	@SuppressWarnings({ "unchecked", "rawtypes" })
	private ObjectProperty<LocalDate> transactionDate = new SimpleObjectProperty(LocalDate.now());
	private SimpleStringProperty discription = new SimpleStringProperty("");
	private SimpleDoubleProperty gas = new SimpleDoubleProperty(0.0);
	private SimpleDoubleProperty service = new SimpleDoubleProperty(0.0);
	private SimpleDoubleProperty john = new SimpleDoubleProperty(0.0);
	private SimpleDoubleProperty medical = new SimpleDoubleProperty(0.0);
	private SimpleDoubleProperty misc = new SimpleDoubleProperty(0.0);

	private SimpleDoubleProperty tax = new SimpleDoubleProperty(0.0);
	private SimpleDoubleProperty saving = new SimpleDoubleProperty(0.0);

	private SimpleDoubleProperty transactionTotal = new SimpleDoubleProperty(0.0);

	public Transaction()
	{
	}

	// ----------------------------------------
	public int get_id()
	{
		return _id;
	}

	// ----------------------------------------
	public void set_id(int _id)
	{
		this._id = _id;
	}

	// ----------------------------------------
	public String getTransactionDate()
	{
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("MM/dd/YYYY");
		return formatter.format(transactionDate.get());
	}

	public void setTransactionDate(LocalDate date)
	{
		this.transactionDate.set(date);
	}

	// ----------------------------------------
	public String getDiscription()
	{
		return discription.get();
	}

	public void setDiscription(String discription)
	{
		this.discription.set(discription);
	}

	// ----------------------------------------
	public double getDoubleGas()
	{
		return gas.get();
	}

	public String getGas()
	{
		if (gas.get() == 0.)
		{
			return "";
		}
		else
		{
			return String.format("%.2f", gas.get());
		}
	}

	public void setGas(double gas)
	{
		this.gas.set(gas);
		addTotal();
	}

	// ----------------------------------------
	public double getDoubleService()
	{
		return service.get();
	}

	public String getService()
	{
		if (service.get() == 0.)
		{
			return "";
		}
		else
		{
			return String.format("%.2f", service.get());
		}
	}

	public void setService(double service)
	{
		this.service.set(service);
		addTotal();
	}

	// ----------------------------------------
	public double getDoubleJohn()
	{
		return john.get();
	}

	public String getJohn()
	{
		if (john.get() == 0.)
		{
			return "";
		}
		else
		{
			return String.format("%.2f", john.get());
		}
	}

	public void setJohn(double john)
	{
		this.john.set(john);
		addTotal();
	}

	// ----------------------------------------
	public double getDoubleMedical()
	{
		return medical.get();
	}

	public String getMedical()
	{
		if (medical.get() == 0.)
		{
			return "";
		}
		else
		{
			return String.format("%.2f", medical.get());
		}
	}

	public void setMedical(double med)
	{
		this.medical.set(med);
		addTotal();
	}

	// ----------------------------------------
	public double getDoubleMisc()
	{
		return misc.get();
	}

	public String getMisc()
	{
		if (misc.get() == 0.)
		{
			return "";
		}
		else
		{
			return String.format("%.2f", misc.get());
		}
	}

	public void setMisc(double misc)
	{
		this.misc.set(misc);
		addTotal();
	}

	// ----------------------------------------
	public double getDoubleTax()
	{
		return tax.get();
	}

	public String getTax()
	{
		if (tax.get() == 0.)
		{
			return "";
		}
		else
		{
			return String.format("%.2f", tax.get());
		}
	}

	public void setTax(double tax)
	{
		this.tax.set(tax);
		addTotal();
	}

	// ----------------------------------------
	public double getDoubleSavings()
	{
		return saving.get();
	}

	public String getSaving()
	{
		if (saving.get() == 0.)
		{
			return "";
		}
		else
		{
			return String.format("%.2f", saving.get());
		}
	}

	public void setSaving(double saving)
	{
		this.saving.set(saving);
		addTotal();
	}

	// ----------------------------------------
	public double getDoubleTransactionTotal()
	{
		return transactionTotal.get();
	}

	public String getTransactionTotal()
	{
		if (transactionTotal.get() == 0.)
		{
			return "";
		}
		else
		{
			return String.format("%.2f", transactionTotal.get());
		}
	}

	private void setTransactionTotal(double transactionTotal)
	{
		this.transactionTotal.set(transactionTotal);
	}

	private void addTotal()
	{
		setTransactionTotal(getDoubleGas()
						+ getDoubleService() + getDoubleJohn() + getDoubleMedical()
						+ getDoubleMisc() + getDoubleTax() + getDoubleSavings());
	}

	@Override
	public String toString()
	{
		return "Transaction [_id="
						+ _id + ", \ntransactionDate=" + transactionDate
						+ ", \ndiscription=" + discription + ", \ngas=" + gas
						+ ", \nservice=" + service + ", \njohn=" + john + ", \nmed="
						+ medical + ", \nmisc=" + misc + ", \ntax=" + tax + ", \nsaving="
						+ saving + ", \ntransactionTotal=" + transactionTotal + "]";
	}

}
