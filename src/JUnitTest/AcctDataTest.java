/**
 * 
 */
package JUnitTest;

import java.util.ArrayList;
import java.util.List;

import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;

import dataModel.AcctData;
import dataModel.Transaction;

/**
 * 
 */
public class AcctDataTest
{

	/**
	 * @throws java.lang.Exception
	 */
	@BeforeClass
	public static void setUpBeforeClass() throws Exception
	{
	}

	/**
	 * @throws java.lang.Exception
	 */
	@AfterClass
	public static void tearDownAfterClass() throws Exception
	{
	}

	/**
	 * @throws java.lang.Exception
	 */
	@Before
	public void setUp() throws Exception
	{
	}

	/**
	 * @throws java.lang.Exception
	 */
	@After
	public void tearDown() throws Exception
	{
	}

	/**
	 * Test method for {@link dataModel.AcctData#queryTransactions(int)}.
	 */
	@Test
	public void testQueryTransactions()
	{
		AcctData data = AcctData.getInstance();

		data.open();

		// try
		// {
		// Statement statement = data.returnConn().createStatement();
		// ResultSet results = statement.executeQuery("SELECT gas FROM
		// TRANSACTIONS WHERE _ID = 1");
		//
		// if (results.next())
		// {
		// double gas = results.getDouble("GAS");
		// System.out.println(gas);
		// }
		//
		// results.close();
		// data.close();
		// }
		//
		// catch (SQLException e)
		// {
		// System.out.println("Query failed: " + e.getMessage());
		// }

		List<Transaction> list = new ArrayList<Transaction>();
		data.queryTransactions(AcctData.ORDER_BY_ASC);

		System.out.println(list.toString());
		System.out.println("*** finish ***");

	}
}