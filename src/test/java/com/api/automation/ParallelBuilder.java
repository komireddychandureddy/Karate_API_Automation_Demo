package com.api.automation;

import org.junit.jupiter.api.Test;

import com.intuit.karate.Runner.Builder;



public class ParallelBuilder {

	 @Test 
	 public void parallelTest() {
		  Builder<?> runner = new Builder();
		  runner.path("classpath:com/api/automation/putrequest");
		  runner.parallel(5);
		  
		  }
		 
}
