package com.api.automation.postrequest;

import com.intuit.karate.junit5.Karate;
import com.intuit.karate.junit5.Karate.Test;

public class ValidateJSONFile {

	
	  @Test public Karate runTest() {
	  
	  return Karate.run("ValidationUsingJSONFile").relativeTo(getClass());
	  
	  }
	 
	
		/*
		 * @Test public Karate runTestusingClasspath() {
		 * 
		 * return
		 * Karate.run("classpath:com/api/automation/getrequest/getrequest.feature");
		 * 
		 * }
		 */
	 
}
