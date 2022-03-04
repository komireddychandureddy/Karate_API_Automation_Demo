package com.api.automation;

import org.junit.jupiter.api.Test;

import com.intuit.karate.Results;
import com.intuit.karate.Runner.Builder;



public class ParallelBuilderwithTags {

	 @Test 
	 public void parallelTest() {
		  Builder<?> runner = new Builder();
		  //runner.path("classpath:com/api/automation/putrequest");
		  runner.path("classpath:com/api/automation");
		  runner.tags("~@Ignore","@Regression");
		  //runner.tags("@Smoke", "@Regression");
		 // runner.tags( "@Regression");
		 // runner.tags("~@Ignore"); //'~' for not 
		
		  Results result = runner.parallel(5);
		  
		  System.out.println("getFeaturesTotal : "+ result.getFeaturesTotal());
		  System.out.println("getScenariosPassed : "+ result.getScenariosPassed());
		  System.out.println("getScenariosFailed : "+ result.getScenariosFailed());
		  System.out.println("getFailCount : "+ result.getFailCount());
		  }
		 
}
