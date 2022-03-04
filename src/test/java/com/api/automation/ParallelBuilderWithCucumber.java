package com.api.automation;

import org.junit.jupiter.api.Test;

import com.intuit.karate.Results;
import com.intuit.karate.Runner.Builder;



public class ParallelBuilderWithCucumber {

	 @Test 
	 public void parallelTest() {
		  Builder<?> runner = new Builder();
		  //runner.path("classpath:com/api/automation/putrequest");
		  runner.path("classpath:com/api/automation");
		  Results result = runner.parallel(5);
		  
		  System.out.println("getFeaturesTotal : "+ result.getFeaturesTotal());
		  System.out.println("getScenariosPassed : "+ result.getScenariosPassed());
		  System.out.println("getScenariosFailed : "+ result.getScenariosFailed());
		  System.out.println("getFailCount : "+ result.getFailCount());
		  }

	 
			/*
			 * private generateCucumberReport() {
			 * 
			 * File reportOutputDirectory = new File("target"); List<String> jsonFiles = new
			 * ArrayList<>(); jsonFiles.add("cucumber-report-1.json");
			 * jsonFiles.add("cucumber-report-2.json");
			 * 
			 * String buildNumber = "1"; String projectName = "cucumberProject";
			 * 
			 * Configuration configuration = new Configuration(reportOutputDirectory,
			 * projectName); // optional configuration - check javadoc for details
			 * configuration.addPresentationModes(PresentationMode.RUN_WITH_JENKINS); // do
			 * not make scenario failed when step has status SKIPPED
			 * configuration.setNotFailingStatuses(Collections.singleton(Status.SKIPPED));
			 * configuration.setBuildNumber(buildNumber); // addidtional metadata presented
			 * on main page configuration.addClassifications("Platform", "Windows");
			 * configuration.addClassifications("Browser", "Firefox");
			 * configuration.addClassifications("Branch", "release/1.0");
			 * 
			 * // optionally add metadata presented on main page via properties file
			 * List<String> classificationFiles = new ArrayList<>();
			 * classificationFiles.add("properties-1.properties");
			 * classificationFiles.add("properties-2.properties");
			 * configuration.addClassificationFiles(classificationFiles);
			 * 
			 * // optionally specify qualifiers for each of the report json files
			 * configuration.addPresentationModes(PresentationMode.PARALLEL_TESTING);
			 * configuration.setQualifier("cucumber-report-1","First report");
			 * configuration.setQualifier("cucumber-report-2","Second report");
			 * 
			 * ReportBuilder reportBuilder=new ReportBuilder(jsonFiles,configuration);
			 * Reportable result=reportBuilder.generateReports(); // and here validate
			 * 'result' to decide what to do if report has failed }
			 */
}
