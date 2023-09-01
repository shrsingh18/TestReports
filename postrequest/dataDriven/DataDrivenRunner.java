package com.api.automation.postrequest.dataDriven;

import com.intuit.karate.junit5.Karate;
import com.intuit.karate.junit5.Karate.Test;

public class DataDrivenRunner {
	
	@Test
	Karate runTests()
	{
		return Karate.run("dataDriven").relativeTo(getClass());
	}

}
