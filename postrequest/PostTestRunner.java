package com.api.automation.postrequest;

import com.intuit.karate.junit5.Karate;
import com.intuit.karate.junit5.Karate.Test;

public class PostTestRunner {
	
	@Test
	Karate runTests()
	{
		//return Karate.run("postJsonRequest", "postXMLRequest","schemaJsonValidation").relativeTo(getClass());
		return Karate.run("complexSchemaJsonValidation").relativeTo(getClass());
	}

}
