package com.api.automation.config.extent.report;

import javax.management.RuntimeErrorException;

import com.aventstack.extentreports.ExtentReports;
import com.aventstack.extentreports.reporter.ExtentSparkReporter;
import com.intuit.karate.Results;

public class GenerateExtentReport {
	
	private ExtentReports extentReports;
	private ExtentSparkReporter extentSparkReporter;
	private String reportDir;
	private Results testResults;
	private String reportTitle = "Karate Extent Report";
	
	public GenerateExtentReport(){
		extentReports = new ExtentReports();
		
	}
	
	public GenerateExtentReport withReportDir(String reportDir)
	{
		this.reportDir = reportDir;
		return this;
	}
	
	public GenerateExtentReport withReportTitle(String reportTitle) {
		this.reportTitle = reportTitle;
		return this;
		
	}
	
	public GenerateExtentReport withTestResults(Results testResults) {
		this.testResults = testResults;
		return this;	
	}
	
	public void generateExtentReport()
	{	
		/*
		-> Check for ReportDir and Test Results, if not present throw exception
		-> Using testResults, get the list of scenario results
		-> loop over the list of scenario results
		-> using scenario result, get the scenario object
		-> using the scenario object, get the info about the feature file
		-> using the same scenario object, we'll get the info about the scenario
		-> using the scenario result, get the list of step result
		-> loop over the step result list, get info about scenario step and it's execution status
		-> Use all the info to generate the extent report 
		*/
		
		if(this.reportDir!=null && this.reportDir.isEmpty() && this.testResults!=null)
		{
			
		}
		
		throw new RuntimeErrorException(null, "Missing Karate Test Result");

	}

}
