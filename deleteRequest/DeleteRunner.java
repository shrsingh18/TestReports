package com.api.automation.deleteRequest;

import com.intuit.karate.junit5.Karate;
import com.intuit.karate.junit5.Karate.Test;

public class DeleteRunner {
	
	@Test
	Karate runTests()
	{
		return Karate.run("deleteJobEntry").relativeTo(getClass());
	}

}
