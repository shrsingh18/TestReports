package com.api.automation.config;

import com.intuit.karate.junit5.Karate;
import com.intuit.karate.junit5.Karate.Test;

public class ConfigRunner {
	
	@Test
	Karate runTests()
	{
		return Karate.run("accessVariablesFromConfig").relativeTo(getClass());
	}

}
