package com.api.automation;

import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;

import com.intuit.karate.Results;
import com.intuit.karate.Runner.Builder;

public class ParallelBuilderWithExtentReport {
	
	@Test
	public void executeResults()
	{
		
		Builder builder = new Builder();
		builder.path("classpath:com/api/automation");
	
		Results results = builder.parallel(5);
		System.out.println("Total Scenarios:" +results.getScenariosTotal());
		System.out.println("Total Passed Scenarios:" +results.getScenariosPassed());
		System.out.println("Total Failed Scenarios:" +results.getScenariosFailed());
		
		System.out.println("Total features -------" +results.getFeaturesTotal());
		System.out.println("Total features passed -------" +results.getFeaturesPassed());
		System.out.println("Total features failed -------" +results.getFeaturesFailed());
		
		Assertions.assertEquals(0, results.getFailCount() , "Some scenarios failed");
	}

}
