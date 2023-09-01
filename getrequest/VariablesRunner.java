package com.api.automation.getrequest;

import com.intuit.karate.junit5.Karate;
import com.intuit.karate.junit5.Karate.Test;

public class VariablesRunner {
	
	@Test
	Karate runTest()
	{
		return Karate.run("variables").relativeTo(getClass());
		
	}
}
