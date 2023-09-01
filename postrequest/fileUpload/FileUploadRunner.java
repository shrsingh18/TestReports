package com.api.automation.postrequest.fileUpload;

import com.intuit.karate.junit5.Karate;
import com.intuit.karate.junit5.Karate.Test;

public class FileUploadRunner {
	
	@Test
	 Karate runTests()
	 {
		return Karate.run("fileUpload").relativeTo(getClass());
	 }

}