package com.api.automation.postrequest;

import com.intuit.karate.junit5.Karate;
import com.intuit.karate.junit5.Karate.Test;

public class EmbeddedExpressionsRunner {
	
	@Test
	Karate runTests()
	{
		return Karate.run("embeddedExpression").relativeTo(getClass());
	}

}
