package com.api.automation.putrequest;

import com.intuit.karate.junit5.Karate;
import com.intuit.karate.junit5.Karate.Test;

public class TestPutRunner {

	
	  @Test public Karate runTest() {
	  
	  return Karate.run("putrequest").relativeTo(getClass());
	  
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
