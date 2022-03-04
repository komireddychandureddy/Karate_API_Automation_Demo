package com.api.automation;

import org.junit.jupiter.api.Test;

import com.intuit.karate.Results;
import com.intuit.karate.Runner.Builder;



public class ParallelBuilderwithTags {

	 @Test 
	 public void parallelTest() {
		  Builder runner = new Builder();
		  //runner.path("classpath:com/api/automation/putrequest");
		  runner.path("classpath:com/api/automation");
		  runner.tags("~@Ignore","@Regression");
		  //runner.tags("@Smoke", "@Regression");
		 // runner.tags( "@Regression");
		 // runner.tags("~@Ignore"); //'~' for not 
		
		  Results result = runner.parallel(5);
		  
		//For old version 1.1.0
		  /*   
		  System.out.println("getFeaturesTotal : "+ result.getFeaturesTotal());
		  System.out.println("getScenarios: "+ result.getScenariosTotal());
		  System.out.println("getScenariospassCount: "+ result.getScenariosPassed());
		  
		  System.out.println("getScenariosFailCount: "+ result.getScenariosFailed());  
			 */
		  //For old version 0.9.6
		   
			  System.out.println("getFeaturesTotal : "+ result.getFeatureCount());
			  System.out.println("getScenarios: "+ result.getScenarioCount());
			  System.out.println("getpassCount: "+ result.getPassCount());
			 
		  
		System.out.println("getFailCount : "+ result.getFailCount());
		  }
		
		 
}
