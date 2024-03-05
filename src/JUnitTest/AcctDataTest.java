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
import javafx.application.Platform;

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
		
        if(!AcctData.getInstance().open()) {
            System.out.println("FATAL ERROR: Couldn't connect to database");
            Platform.exit();
        }
		
		list = AcctData.getInstance().queryTransactions(3);
		
		int i = 0;
		int max = list.size();
		
		while (i < max)
		{
			Transaction temp = list.get(i);
			System.out.println(temp.toString());
			i++;
		}
		
		AcctData.getInstance().close();
	}
}










