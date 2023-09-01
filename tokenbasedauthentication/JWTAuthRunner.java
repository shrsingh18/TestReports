package com.api.automation.tokenbasedauthentication;

import com.intuit.karate.junit5.Karate;
import com.intuit.karate.junit5.Karate.Test;

public class JWTAuthRunner {
	
	@Test
	Karate runTests()
	{
		return Karate.run("jwtTokenAuth").relativeTo(getClass());
	}

}
