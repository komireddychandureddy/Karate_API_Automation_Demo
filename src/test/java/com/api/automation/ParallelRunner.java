package com.api.automation;

import org.junit.jupiter.api.Test;

import com.intuit.karate.Runner;
import com.intuit.karate.Runner.Builder;



public class ParallelRunner {

	 @Test 
	 public void parallelTest() {
		  
		  Runner.parallel(getClass(),5);
		  
			/*
			 * Builder<?> runner = new Builder();
			 * runner.path("classpath:com/api/automation/putrequest"); runner.parallel(5);
			 * Runner.parallel(runner);
			 */
		  }
		 
}
