package com.api.automation.postrequest;

import com.intuit.karate.junit5.Karate;
import com.intuit.karate.junit5.Karate.Test;

public class TestPostRunner {

	/*
	  @Test public Karate runTest() {
	  
	  return Karate.run("postrequest.feature").relativeTo(getClass());
	  
	  }
	  */
	  
 @Test public Karate runTest() {
		  
		  return Karate.run( "fileupload").relativeTo(getClass());
		  
		  }
 /*
 @Test public Karate runTest() {
	  
	  return Karate.run( "Embeddedpostrequest.feature", "SchemaValidation.feature").relativeTo(getClass());
	  
	  }
 */
/* @Test public Karate runTest() {
	  
	  return Karate.run( "JavaScriptExecutor.feature").relativeTo(getClass());
	  
	  }*/

 
	 
	
		/*
		 * @Test public Karate runTestusingClasspath() {
		 * 
		 * return
		 * Karate.run("classpath:com/api/automation/getrequest/getrequest.feature");
		 * 
		 * }
		 */
	 
}
