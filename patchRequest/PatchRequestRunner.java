package com.api.automation.patchRequest;

import com.intuit.karate.junit5.Karate;
import com.intuit.karate.junit5.Karate.Test;

public class PatchRequestRunner {
	
	@Test
	Karate executeTests()
	{
		return Karate.run("updateDetailsUsingPatchRequest").relativeTo(getClass());
	}

}
