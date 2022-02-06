package com.api.automation;

import org.junit.jupiter.api.Test;

import com.intuit.karate.Results;
import com.intuit.karate.Runner.Builder;



public class ParallelBuilder {

	 @Test 
	 public void parallelTest() {
		  Builder<?> runner = new Builder();
		  runner.path("classpath:com/api/automation/putrequest");
		  Results result = runner.parallel(5);
		  
		  System.out.println("getFeaturesTotal : "+ result.getFeaturesTotal());
		  System.out.println("getScenariosPassed : "+ result.getScenariosPassed());
		  System.out.println("getScenariosFailed : "+ result.getScenariosFailed());
		  System.out.println("getFailCount : "+ result.getFailCount());
		  }
		 
}
