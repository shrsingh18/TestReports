package com.api.automation.ignore;

import com.intuit.karate.junit5.Karate;
import com.intuit.karate.junit5.Karate.Test;

public class GetTestRunner {
	
	// relative path
	@Test
	public Karate runTest()
	{
		//return Karate.run("getRequestDemo","responseMatcher" , "validateJsonArray").relativeTo(getClass());
		return Karate.run("deleteJobEntry", "getRequest").tags("~@ignore").relativeTo(getClass());
		//getClass() returns the runtime class name with package structure
		//relativeTo() identifies where the feature file is located and it invokes that
	}
	
	// absolute path of the feature file
	/*
	@Test
	public Karate runTestWithClasspath()
	{
		return Karate.run("classpath:com/api/automation/getrequest/getRequestDemo.feature");
		
	}
	*/

}
