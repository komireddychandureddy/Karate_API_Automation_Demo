package com.api.automation.patchrequest.queryparameter;

import com.intuit.karate.junit5.Karate;
import com.intuit.karate.junit5.Karate.Test;

public class TestPatchRunner {

	
 @Test 
 public Karate runTest() {
		  
		  return Karate.run( "patchrequestwithqueryparameter").relativeTo(getClass());
		  
		  }	 
}
