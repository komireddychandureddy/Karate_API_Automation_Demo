package com.api.automation.secure.getrequest;

import com.intuit.karate.junit5.Karate;
import com.intuit.karate.junit5.Karate.Test;

public class TestRunner {

	
	  @Test public Karate runTest() {
	  
	  return Karate.run("securegetrequest", "tokenrequest").relativeTo(getClass());
	  
	  }
	 
}
