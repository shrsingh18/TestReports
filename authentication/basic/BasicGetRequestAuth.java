package com.api.automation.authentication.basic;

import com.intuit.karate.junit5.Karate;
import com.intuit.karate.junit5.Karate.Test;

public class BasicGetRequestAuth {
	
	@Test
	Karate executeTests()
	{
		return Karate.run("basicAuthWithJs").relativeTo(getClass());
	}

}
