package com.api.automation.getrequest;

import com.intuit.karate.junit5.Karate;
import com.intuit.karate.junit5.Karate.Test;

public class TestRunner {

	@Test
	public Karate runTest() {
		
		return Karate.run("getrequest").relativeTo(getClass());
		
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
