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
		List<Transaction> list = new ArrayList<Transaction>();

		list = AcctData.getInstance().queryTransactions(3);
		
		int i = 0;
		while (list.size() > i)
		{
			Transaction temp = list.get(i);
			System.out.println(temp.toString());
		}
	}
}










