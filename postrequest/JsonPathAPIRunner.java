package com.api.automation.postrequest;

import com.intuit.karate.junit5.Karate;
import com.intuit.karate.junit5.Karate.Test;

public class JsonPathAPIRunner {
	
	@Test
	Karate runTests()
	{
		
		return Karate.run("jsonPathAPI").relativeTo(getClass());
	}

}
