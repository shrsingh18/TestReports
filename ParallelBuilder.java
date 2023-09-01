package com.api.automation;

import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;

import com.intuit.karate.Results;
import com.intuit.karate.Runner.Builder;

public class ParallelBuilder {
	
	@Test
	public void executeTests()
	{
		Builder aRunner = new Builder();
		aRunner.path("classpath:com/api/automation/getrequest");
		//aRunner.parallel(5);
		
		// We can use Results class to extract the result
		Results result = aRunner.parallel(5);
		System.out.println("Total features -------" +result.getFeaturesTotal());
		System.out.println("Total features passed -------" +result.getFeaturesPassed());
		System.out.println("Total features failed -------" +result.getFeaturesFailed());
		
		System.out.println("Total scenarios -------" +result.getScenariosTotal());
		System.out.println("Total scenarios passed -------" +result.getScenariosPassed());
		System.out.println("Total scenarios failed -------" +result.getScenariosFailed());
		
		// applying assertions to the number of failed scenarios to mark the runner test as passed or failed
		Assertions.assertEquals(0, result.getFailCount(), "There are some scenarios that have failed");
	}

}
