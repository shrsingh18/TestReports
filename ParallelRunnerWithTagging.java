package com.api.automation;

import java.util.Arrays;
import java.util.Collections;
import java.util.List;

import org.junit.jupiter.api.Test;

import com.intuit.karate.Runner;
import com.intuit.karate.Runner.Builder;

public class ParallelRunnerWithTagging {
	
	private static final String CLASS_PATH = "classpath:";
	private static final String DELIMITER = ",";
	@Test
	public void executeKarateTests()
	{
		Builder b = new Builder();
		//b.path(getLocation());
		b.path(getMultipleLocation());
		b.parallel(5);
		//b.tags(getTags());
		b.path(getMultipleTags());
	}
	
	/*
	private List<String> getTags()
	{	
		String aTags = System.getProperty("tags" , "@Smoke");
		List<String> tagsList = Arrays.asList(aTags);
		return tagsList;
	}
	

	private List<String> getLocation()
	{	
		String aLocation = System.getProperty("location" , "com/api/automation");
		List<String> locationsList = Arrays.asList(CLASS_PATH + aLocation);
		return locationsList;
	}
	*/
	
	// Approach 2: Where we have multiple location and tag values 
	private List<String> getMultipleTags()
	{
		String aTags = System.getProperty("tags", "@Smoke");
		List<String> tagsList = Collections.emptyList();
		// Logic:
		/*
		 * We'll put an if condition to check if the delimiter (,) is present or not, if present
		 * then split the string using the delimiter and store it in the String array
		 * create a list out of it
		 * if aTags has no delimiter, then follow the code in getTags()
		 */
		
		if(aTags.contains(DELIMITER))
		{
			String tagArray [] = aTags.split(DELIMITER);
			tagsList = Arrays.asList(tagArray);
			return tagsList;
		}
		tagsList = Arrays.asList(aTags);
		return tagsList;
	}
	
	private List<String> getMultipleLocation()
	{
		String aLocations = System.getProperty("location" , "com/api/automation");
		List<String> locationsList = Collections.emptyList();
		
		if(aLocations.contains(DELIMITER))
		{
			String locationArray[] = aLocations.split(DELIMITER);
			locationsList = Arrays.asList(locationArray);
			locationsList.replaceAll((entry) -> {
				return CLASS_PATH + entry;
			});
			return locationsList;
		}
		
		locationsList = Arrays.asList(CLASS_PATH + aLocations);
		return locationsList;
	}
	
	// for debugging this class, debug configuration -> add vm arguments for location and tags as -Dlocation
	// -Dtags 
}
