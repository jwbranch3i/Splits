package dataModel;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import javafx.collections.FXCollections;
import javafx.collections.ObservableList;

public class AcctData
{

	public static final String DB_NAME = "accounts.db";
	public static final String CONNECTION_STRING = "jdbc:sqlite:D:/Splits/splits/"
					+ DB_NAME;

	/* table - transactions */
	public static final String TABLE_TRANSACTIONS = "transactions";
	public static final String COL_TRANSACTIONS_ID = "_ID";
	public static final String COL_TRANSACTIONS_DATE = "date";
	public static final String COL_TRANSACTIONS_DISCRIPTION = "discription";
	public static final String COL_TRANSACTIONS_GAS = "gas";
	public static final String COL_TRANSACTIONS_SERVICE = "service";
	public static final String COL_TRANSACTIONS_JOHN = "john";
	public static final String COL_TRANSACTIONS_MED = "medical";
	public static final String COL_TRANSACTIONS_MISC = "misc";
	public static final String COL_TRANSACTIONS_TAX = "tax";
	public static final String COL_TRANSACTIONS_SAVINGS = "savings";

	public static final int INDEX_TRANSACTIONS_ID = 1;
	public static final int INDEX_TRANSACTIONS_DATE = 2;
	public static final int INDEX_TRANSACTIONS_DISCRIPTION = 3;
	public static final int INDEX_TRANSACTIONS_GAS = 4;
	public static final int INDEX_TRANSACTIONS_SERVICE = 5;
	public static final int INDEX_TRANSACTIONS_JOHN = 6;
	public static final int INDEX_TRANSACTIONS_MEDICAL = 7;
	public static final int INDEX_TRANSACTIONS_MISC = 8;
	public static final int INDEX_TRANSACTIONS_TAX = 9;
	public static final int INDEX_TRANSACTIONS_SAVINGS = 10;

	public static final int ORDER_BY_NONE = 1;
	public static final int ORDER_BY_ASC = 2;
	public static final int ORDER_BY_DESC = 3;

	private Connection conn;

	private static AcctData instance = new AcctData();

	private AcctData()
	{
	}

	public static AcctData getInstance()
	{
		return instance;
	}

	/****************************************/
	public boolean open()
	{
		try
		{
			conn = DriverManager.getConnection(CONNECTION_STRING);
			return true;
		}
		catch (SQLException e)
		{
			System.out.println("Couldn't connect to database: " + e.getMessage());
			return false;
		}
	}

	/****************************************/
	public void close()
	{
		try
		{
			if (conn != null)
			{
				conn.close();
			}
		}
		catch (SQLException e)
		{
			System.out.println("Couldn't close connection" + e.getMessage());
		}
	}

	private ObservableList<Transaction> register = FXCollections.observableArrayList();

	private double totalGas = 0.0;
	private double totalService = 0.0;
	private double totalJohn = 0.0;
	private double totalMedical = 0.0;
	private double totalMisc = 0.0;
	private double totalAcct = 0.0;

	public ObservableList<Transaction> getRegister()
	{
		return register;
	}

	public double getTotalGas()
	{
		return totalGas;
	}

	public double getTotalService()
	{
		return totalService;
	}

	public double getTotalJohn()
	{
		return totalJohn;
	}

	public double getTotalMed()
	{
		return totalMedical;
	}

	public double getTotalMisc()
	{
		return totalMisc;
	}

	public double getTotalAcct()
	{
		return totalAcct;
	}

	public List<Transaction> queryTransactions(int sortOrder)
	{
		StringBuilder sb = new StringBuilder("SELECT ");
		sb.append("_id, date, discription, gas, service, john, medical, misc  FROM ");
		sb.append(TABLE_TRANSACTIONS);
		if (sortOrder != ORDER_BY_NONE)
			;
		{
			sb.append(" ORDER BY ");
			sb.append(COL_TRANSACTIONS_DATE);
			if (sortOrder == ORDER_BY_DESC)
			{
				sb.append(" DESC");
			}
			else
			{
				sb.append(" ASC");
			}
		}
		
		
		try 
		{
			System.out.println(sb.toString());
			Statement statement = conn.createStatement();
			ResultSet results = statement.executeQuery(sb.toString());
			System.out.println("***after");
			List<Transaction> list = new ArrayList<Transaction>();
			while (results.next())
			{
				Transaction transaction = new Transaction();
				transaction.set_id(results.getInt(INDEX_TRANSACTIONS_ID));
				transaction.setTransactionDate(LocalDate.parse(results.getString(INDEX_TRANSACTIONS_DATE)));
				transaction.setDiscription(results.getString(INDEX_TRANSACTIONS_DISCRIPTION));
				transaction.setGas(results.getDouble(INDEX_TRANSACTIONS_GAS));
				transaction.setService(results.getDouble(INDEX_TRANSACTIONS_SERVICE));
				transaction.setJohn(results.getDouble(INDEX_TRANSACTIONS_JOHN));
				transaction.setMedical(results.getDouble(INDEX_TRANSACTIONS_MEDICAL));
				transaction.setMisc(results.getDouble(INDEX_TRANSACTIONS_MISC));

				list.add(transaction);
			}
			System.out.println(list.toString());
			return list;
		}
		catch (

		SQLException e)
		{
			System.out.println("Query failed: " + e.getMessage());
			return null;
		}
	}

	private void addToTotal(Transaction transaction)
	{
		totalGas += transaction.getDoubleGas();
		totalService += transaction.getDoubleService();
		totalJohn += transaction.getDoubleJohn();
		totalMedical += transaction.getDoubleMedical();
		totalMisc += transaction.getDoubleMisc();

		totalAcct = 0.00;
		totalAcct = totalGas + totalService + totalJohn + totalMedical + totalMisc;

	}

}
