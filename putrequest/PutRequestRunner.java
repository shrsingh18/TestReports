package com.api.automation.putrequest;

import com.intuit.karate.junit5.Karate;
import com.intuit.karate.junit5.Karate.Test;

public class PutRequestRunner {
	
	@Test
	Karate runPutRequest()
	{
		return Karate.run("putRequest","putRequestWithDynamicJobId").relativeTo(getClass());
	}

}
