package com.api.automation.getrequest;

import com.intuit.karate.junit5.Karate;
import com.intuit.karate.junit5.Karate.Test;

public class ValidationUsingExternalFile {
	
	@Test
	Karate runTests()
	{
		return Karate.run("readingDataFromExternalFile").relativeTo(getClass());
	}
}
