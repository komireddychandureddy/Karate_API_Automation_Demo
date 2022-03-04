package com.api.automation;

import java.io.File;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.apache.commons.io.FileUtils;
import org.junit.jupiter.api.Test;

import com.intuit.karate.Results;
import com.intuit.karate.Runner.Builder;

import net.masterthought.cucumber.Configuration;
import net.masterthought.cucumber.ReportBuilder;
import net.masterthought.cucumber.Reportable;



public class ParallelBuilderWithCucumber {

	@Test 
	public void parallelTest() {
		Builder runner = new Builder();
		//runner.path("classpath:com/api/automation/putrequest");
		runner.path("classpath:com/api/automation");

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

		generateCucumberReport(result.getReportDir());
	}


	//D:\github\Karate_API_Automation_Demo\target\karate-reports
	private void generateCucumberReportOld(String getReportDir) {

		File reportOutputDirectory = new File(getReportDir);

		List<String> jsonFiles = new ArrayList<>(); 
		jsonFiles.add("cucumber-report-1.json");
		jsonFiles.add("cucumber-report-2.json");

		String buildNumber = "1"; String projectName = "cucumberProject";

		Configuration configuration = new Configuration(reportOutputDirectory,projectName); // optional configuration - check javadoc for details
/*		configuration.addPresentationModes(PresentationMode.RUN_WITH_JENKINS); // do not make scenario failed when step has status SKIPPED
		configuration.setNotFailingStatuses(Collections.singleton(Status.SKIPPED));
		configuration.setBuildNumber(buildNumber); // addidtional metadata presented on main page configuration.addClassifications("Platform", "Windows");
		configuration.addClassifications("Browser", "Firefox");
		configuration.addClassifications("Branch", "release/1.0");

		// optionally add metadata presented on main page via properties file
		List<String> classificationFiles = new ArrayList<>();
		classificationFiles.add("properties-1.properties");
		classificationFiles.add("properties-2.properties");
		configuration.addClassificationFiles(classificationFiles);

		// optionally specify qualifiers for each of the report json files
		configuration.addPresentationModes(PresentationMode.PARALLEL_TESTING);
		configuration.setQualifier("cucumber-report-1","First report");
		configuration.setQualifier("cucumber-report-2","Second report");
*/
		ReportBuilder reportBuilder=new ReportBuilder(jsonFiles,configuration);
		Reportable result=reportBuilder.generateReports(); // and here validate 'result' to decide what to do if report has failed 
	}
	private void generateCucumberReport(String getReportDir) {

			File reportOutputDirectory = new File(getReportDir);
			Collection<File> jsonCollection = FileUtils.listFiles(reportOutputDirectory, new String[] {"json"}, true);
			List<String> jsonFiles = new ArrayList<>(); 
			//jsonFiles.add("cucumber-report-1.json");
			//jsonFiles.add("cucumber-report-2.json");
			jsonCollection.forEach(files -> jsonFiles.add(files.getAbsolutePath()));
			String buildNumber = "1"; String projectName = "Karate cucumber Project";

			Configuration configuration = new Configuration(reportOutputDirectory,projectName); // optional configuration - check javadoc for details
		ReportBuilder reportBuilder=new ReportBuilder(jsonFiles,configuration);
			Reportable result=reportBuilder.generateReports(); // and here validate 'result' to decide what to do if report has failed 
		}

}
