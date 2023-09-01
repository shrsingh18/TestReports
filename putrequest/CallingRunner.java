package com.api.automation.putrequest;

import com.intuit.karate.junit5.Karate;
import com.intuit.karate.junit5.Karate.Test;

public class CallingRunner {
	
	@Test
	Karate runPutRequest()
	{
		return Karate.run("callingFeatureFile").relativeTo(getClass());
	}

}
