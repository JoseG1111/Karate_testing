package co.com.project.pokeapi;


import com.intuit.karate.Results;
import com.intuit.karate.Runner;

import net.masterthought.cucumber.Configuration;
import net.masterthought.cucumber.ReportBuilder;

import org.junit.jupiter.api.Test;

import java.io.File;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import org.apache.commons.io.FileUtils;

import static org.junit.jupiter.api.Assertions.assertEquals;

public class TestRunner {

    @Test
    void testParallel(){
        Results results = Runner.path("classpath:co/com/project/pokeapi")
                .outputCucumberJson(true)
               // .tags("@ignore")
                .parallel(5);
        generateReports(results.getReportDir());
        assertEquals(0, results.getFailCount(), results.getErrorMessages());

    }
    public static void generateReports(String karateOutputPath){
        Collection<File> jsonFiles = FileUtils.listFiles(new File(karateOutputPath), new String[]{"json"}, true) ;
        List<String> jsonPaths = new ArrayList<>(jsonFiles.size());
        jsonFiles.forEach(file -> jsonPaths.add(file.getAbsolutePath()));
        Configuration config = new Configuration(new File("build"), "Bancolombia");
        ReportBuilder reportBuilder = new ReportBuilder(jsonPaths, config);
        reportBuilder.generateReports();



    }
}
