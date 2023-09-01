package com.api.automation.getrequest.queryparams;

import com.intuit.karate.junit5.Karate;
import com.intuit.karate.junit5.Karate.Test;

public class QueryParamRunner {
	
	@Test
	Karate executeQueryParam()
	{
		return Karate.run("queryParams").relativeTo(getClass());
	}

}
