package com.api.automation;

import java.io.File;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.apache.commons.io.FileUtils;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;


import com.intuit.karate.Results;
import com.intuit.karate.Runner.Builder;

import net.masterthought.cucumber.Configuration;
import net.masterthought.cucumber.ReportBuilder;

public class ParallelBuilderWithCucumberReport {
	
	@Test
	public void executeTests()
	{
		Builder aRunner = new Builder();
		//aRunner.path("classpath:com/api/automation/getrequest");
		aRunner.path("classpath:com/api/automation").outputCucumberJson(true); 
		//aRunner.parallel(5);
		
		// We can use Results class to extract the result
		Results result = aRunner.parallel(5);
		System.out.println("Total features -------" +result.getFeaturesTotal());
		System.out.println("Total features passed -------" +result.getFeaturesPassed());
		System.out.println("Total features failed -------" +result.getFeaturesFailed());
		
		System.out.println("Total scenarios -------" +result.getScenariosTotal());
		System.out.println("Total scenarios passed -------" +result.getScenariosPassed());
		System.out.println("Total scenarios failed -------" +result.getScenariosFailed());
		
		generateCucumberReport(result.getReportDir());
		// applying assertions to the number of failed scenarios to mark the runner test as passed or failed
		Assertions.assertEquals(0, result.getFailCount(), "There are some scenarios that have failed");
	}
	
	private void generateCucumberReport(String reportDirLocation)
	{
		File reportDirectory = new File(reportDirLocation);
		Collection<File> jsonCollection = 	FileUtils.listFiles(reportDirectory, new String[] {"json"}, true);
		
		List<String> jsonFiles = new ArrayList<String>();
		jsonCollection.forEach(file -> jsonFiles.add(file.getAbsolutePath()));
		
		Configuration config = new Configuration(reportDirectory,"Karate  Framework");
		ReportBuilder reportBuilder = new ReportBuilder(jsonFiles, config);
		
		reportBuilder.generateReports();
	}
}
